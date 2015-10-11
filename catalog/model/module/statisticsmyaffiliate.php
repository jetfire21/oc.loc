<?php
class ModelModuleStatisticsmyaffiliate extends Model {//('tracking', $tracking);

    public function ISEXISTS($table_name) {
        $query = $this->db->query("select * from  information_schema.columns where TABLE_SCHEMA = '" . DB_DATABASE . "' and table_name = '" . DB_PREFIX . $table_name . "'");
        return $query->num_rows;
    }
	
	public function getAffiliatesChildren($implode, $level) {
	    $text = '';
        $sql = "SELECT affiliate_id FROM `" . DB_PREFIX . "affiliate` ";
        if ($implode) {
            $sql .= " WHERE " . implode(" OR ", $implode);
        }
        $query = $this->db->query($sql);
		$result = $query->rows;
		$implode = array();
		foreach ($query->rows as $res) {
			$implode[] = "parent = '" . (int)$res['affiliate_id'] . "'";
			$text = $text.','.$res['affiliate_id'];
		}
		$getlevel = explode(',,', $text);
		if(count($getlevel)<$level) {
			if ($implode) {
				$text = $text.','.$this->getAffiliatesChildren($implode, $level);
			}
		}
        return $text;
    }
	//explode(',,', $text);

	// public function getChildrenLevel($text, $level) {
	// 	$text = trim($text,',');
	// 	$count = 0;
	// 	$getlevel = explode(',,', $text);
	// 	$return = array();
	// 	foreach ($getlevel as $l) {
	// 		$getaffiliate = explode(',', $l);
	// 		$count++;
	// 		if($count<=$level){
	// 			foreach ($getaffiliate as $a) {
	// 				$return[] = array(
	// 					'level' => $count,
	// 					'affiliate_id' => $a
	// 				);
	// 			}
	// 		}
	// 	}
		
 //        return $return;
 //    }


public function getChildrenLevel($text, $level, $aff_id) {
		$text = trim($text,',');
		$count = 0;
		$getlevel = explode(',,', $text);
		$result = array();

		foreach ($getlevel as $l) {
			$getaffiliate = explode(',', $l);
			$count++;
			if($count<=$level){
				foreach ($getaffiliate as $a) {
					$result[] = array(
						'level' => $count,
						'affiliate_id' => $a,
                        'parent' => $this->getAffiliateParent($a, 0, 0)
					);
				}
			}
		}
        $return = array();
        // $this->sortAffiliates($result, $return, $this->affiliate->getId());
        $this->sortAffiliates($result, $return, $aff_id);

        return $return;
    }

    private function sortAffiliates($results, &$return, $parentId = null) {
        foreach ($results as $item) {
            if ($parentId == $item['parent']) {
                $return[] = $item;
                $this->sortAffiliates($results, $return, $item['affiliate_id']);
            }
        }
        return;
    }
	
    public function GetStatisticsOrders($affiliate_id, $data) {
        $sql = "SELECT count(total) as count_orders, SUM(total) as sum_orders FROM `" . DB_PREFIX . "order` ";
        $rezult_data = $this->end($affiliate_id, $data, $sql, 0);
        return $rezult_data;
    }

    public function GetStatisticsShopping($affiliate_id, $data) {
        $sql = "SELECT count(total) as count_shopping, SUM(total) as sum_shopping FROM `" . DB_PREFIX . "order` ";
        $rezult_data = $this->end($affiliate_id, $data, $sql, (int) $this->config->get('config_complete_status_id'));
        return $rezult_data;
    }

    public function GetStatisticsSum($affiliate_id, $affiliate_children, $data) {

        $sql = "SELECT SUM(case when amount > 0 then amount else 0 end) AS commission FROM " . DB_PREFIX . "affiliate_transaction ";
        $rezult_data = $this->end($affiliate_id, $data, $sql, -1, $affiliate_children);
        return $rezult_data;

    }

    private function end($affiliate_id, $data, $sql, $order_status_id = -1, $affiliate_children = 0) {
		
		$implode[] = "affiliate_id = '" . (int) $affiliate_id . "'";
		if($affiliate_children!=0){
			$implode[] = "affiliate_children = '" . (int) $affiliate_children . "'";
		}

        if ($order_status_id != -1) {
            if ($order_status_id == 0) {
                $implode[] = "order_status_id != '" . $order_status_id . "'";
            } else {
                $implode[] = "order_status_id = '" . $order_status_id . "'";
            }
        }

        if (!empty($data['filter_date_start'])) {
            $implode[] = "DATE(date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }

        if (!empty($data['filter_date_end'])) {
            $implode[] = "DATE(date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $query = $this->db->query($sql);
        return $query->row; 

    }
	
	public function isAffiliate(){
		if($this->config->get('affiliate_customer_lifetime')){
			if(isset($this->session->data['customer_id'])){
				$customer_id = $this->session->data['customer_id'];
				$query = $this->db->query("SELECT parent FROM " . DB_PREFIX . "customer WHERE customer_id = '" . $customer_id . "'");
				$parent_customer = $query->row['parent'];
				if($parent_customer != 0){
					$query = $this->db->query("SELECT code FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . $parent_customer . "'");
					if ($query->num_rows) {
						setcookie('tracking', $query->row['code']);
						$this->session->data['tracking'] = $query->row['code'];
						$this->request->cookie['tracking'] = $query->row['code'];
					}
				} elseif(isset($this->request->cookie['tracking'])) {
					$query = $this->db->query("SELECT affiliate_id FROM " . DB_PREFIX . "affiliate WHERE code = '" . $this->request->cookie['tracking'] . "'");
					if ($query->num_rows) {
						$query = $this->db->query("UPDATE " . DB_PREFIX . "customer SET parent =". $query->row['affiliate_id'] ." WHERE customer_id = '" . (int)$customer_id . "'");
					}
				}
			}
		}
	}
	
	public function getAffiliateParent($affiliate_id, $count, $limit) {
        $result = '';
        $query = $this->db->query("SELECT parent FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . $affiliate_id . "'");
		if ($query->num_rows) {
			$affiliate_id = $query->row['parent'];
			$count = $count + 1;
			if($affiliate_id!=0) {
				$result = $affiliate_id;
				if($count <= $limit) {
					$result = $result.','.$this->getAffiliateParent($affiliate_id, $count, $limit);
				}
			}
		}
	    return $result;
    }
	
	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' and sort_order = 1");

		return $query->row['value'];
	}
	
    public function getAffiliateCommission($text, $levels, $order_info) {
        $text = trim($text,',');
		$getaffiliate= explode(',', $text);
		$count = 1;
		$return = array();
		$level_max = count($levels);
		$ordertotal = ((float)$this->getOrderTotals($order_info['order_id']) / 10000);
		$oldcommission = -1;
		foreach ($getaffiliate as $affiliate_id) {
			if(((int)$affiliate_id != 0) & ($count <= $level_max)) {
				if($oldcommission == -1) {
					$oldcommission = (double) $this->getOrder($order_info['order_id']);
				}
				$commission = $oldcommission * $levels[$count]['level_commission'] / 100; 
				$return[] = array(
					'affiliate_id' => $affiliate_id,
					'affiliate_name' => $this->getAffiliatesName((int)$affiliate_id),
					'level' => $count,
					'total' => $commission,
					'commission' => $this->currency->format($commission, $order_info['currency_code'], $order_info['currency_value'])
				);
				$count = $count + 1;
				if ($count <= $level_max) {
					$oldcommission = $commission;
				}
			}
		}
		return $return;
    }
	
	public function getOrder($order_id) {
		$query = $this->db->query("SELECT commission FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
		if($query->num_rows)
		  return $query->row['commission'];
		return 0;
	}
	
	public function getAffiliatesName($affiliate_id) {
        $sql = "SELECT CONCAT(firstname, ' ', lastname) AS name FROM `" . DB_PREFIX . "affiliate` WHERE affiliate_id = '" . (int) $affiliate_id . "'";
        $query = $this->db->query($sql);
		if ($query->num_rows) {
			return $query->row['name'];
		}
		return '';
    }
	
	public function getOrderCommission($order_id) {		
		$query = $this->db->query("SELECT sum(CASE WHEN (SELECT sum(ps.price) FROM `" . DB_PREFIX . "product_special` ps WHERE ps.product_id = p.product_id) IS NOT NULL THEN (SELECT sum(ps.price) FROM `" . DB_PREFIX . "product_special` ps WHERE ps.product_id = p.product_id) ELSE p.price END * orp.quantity * p.affiliate_commission) AS value FROM `" . DB_PREFIX . "product` p LEFT JOIN `" . DB_PREFIX . "order_product` orp ON (orp.product_id = p.product_id) WHERE order_id = '" . (int)$order_id . "'");
		if($query->num_rows)
		  return $query->row['value'];
		return 0;
	}
	
	public function getRegUrl() {
		return $this->url->link('affiliate/register'. $this->getSumbol(). 'tracking='.$this->affiliate->getCode());
	}
	
	public function getSumbol() {
		$affiliate_sumbol = $this->config->get('config_affiliate_sumbol');
		if (!$this->config->get('config_affiliate_sumbol')) {
			return '&';
		} else if ($affiliate_sumbol == 2) {
			return '?';
		}
		return '&';
	}

	public function getParentByCustomerId($customer_id) {
		$query = $this->db->query("SELECT parent FROM `" . DB_PREFIX . "affiliate` WHERE customer_id = '" . (int)$customer_id . "'");
		if($query->num_rows) return $query->row['parent'];
		return 0;
	}

	public function getPhoneEmail($affiliate_id) {
		$query = $this->db->query("SELECT email,telephone,date_added FROM `" . DB_PREFIX . "affiliate` WHERE affiliate_id = '" . (int)$affiliate_id . "'");
		if($query->num_rows) return $query->row;
		return 0;
	}

	public function getCountAff($affiliate_id) {
		$query = $this->db->query("SELECT count(parent) FROM `" . DB_PREFIX . "affiliate` WHERE parent = '" . (int)$affiliate_id . "'");
		if($query->num_rows) return $query->row['count(parent)'];
		return 0;
	}

	public function getAffiliate($affiliate_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");
		
		return $query->row;
	}

	public function checkCustomerId($customer_id) {
		$query = $this->db->query("SELECT customer_id FROM " . DB_PREFIX . "affiliate WHERE customer_id = '" . (int)$customer_id . "'");
		
		return $query->num_rows;
	}

    public function getAffId($customer_id) {
        $query = $this->db->query("SELECT affiliate_id FROM " . DB_PREFIX . "affiliate WHERE customer_id = '" . (int)$customer_id . "'");
        
        return $query->row['affiliate_id']; 
    }

    public function getTotalSumRef($aff_id) {
        $query = $this->db->query("SELECT SUM(amount) FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_id = '" . (int)$aff_id . "'");
        
        return $query->row['SUM(amount)']; 
    }

     public function getBalansAff($aff_id) {
        $query = $this->db->query("SELECT balans FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int)$aff_id . "'");
        
        return $query->row['balans']; 
    }

     public function updateBalansAff($aff_id,$balans) {
        $this->db->query("UPDATE " . DB_PREFIX . "affiliate SET balans='".$balans."' WHERE affiliate_id = '" . (int)$aff_id . "'");
        
    }

     public function withdrawal($aff_id, $name_fam, $sum_out) {

        $query = $this->db->query("UPDATE " . DB_PREFIX . "affiliate SET balans='0' WHERE affiliate_id = '" . (int)$aff_id . "'");

        $balans = $this->getBalansAff($aff_id);
        if($balans > 0){
        	$ostatok = $balans - $sum_out;
        }
        else $ostatok = 0;

        $this->db->query("INSERT INTO `" . DB_PREFIX . "affiliate_transaction` SET affiliate_id = '" . (int)$aff_id . "',operation = 'Запрошен вывод', withdrawal='1', name='".$name_fam."',ostatok = '" . (float)$ostatok."', amount = '" . (float)$sum_out . "', date_added = NOW()");
    }

     public function addTransaction($aff_id, $name_fam, $sum_pay, $balans_after_pay) {

        $this->db->query("INSERT INTO `" . DB_PREFIX . "affiliate_transaction` SET affiliate_id = '" . (int)$aff_id . "',operation = 'Оплата товара', withdrawal='1', name='я(".$name_fam.")', amount = '" . (float)$sum_pay . "' , ostatok = '" . (float)$balans_after_pay . "', date_added = NOW()");
    }

}
?>