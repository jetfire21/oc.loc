<?php
/******************************************************
 * @package Checkout for Opencart 1.5.x
 * @version 1.0
 * @author http://www.webopencart.com
 * @copyright	Copyright (C) Feb 2014 Webopencart.com <@emai:webopencart@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 1
*******************************************************/
class ControllerCheckoutCheckout extends Controller { 
	private $error = array();
	public function index() {
		$this->language->load('checkout/checkout');
		$this->load->model('checkout/order');
		$this->load->model('account/address');
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			echo '<script type="text/javascript">alert("Товара нет в наличии!");</script>';
			$this->redirect($this->url->link('checkout/cart'));
		}

		// Validate minimum quantity requirments.			
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}		

			if ($product['minimum'] > $product_total) {
				//$this->redirect($this->url->link('checkout/cart'));
			}				
		}

		$this->document->setTitle($this->language->get('heading_title')); 
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');

		$this->data['next_order_id'] = $this->model_checkout_order->getLastIdOrder() + 1;

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_cart'),
			'href'      => $this->url->link('checkout/cart'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('checkout/checkout', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_checkout_option'] = $this->language->get('text_checkout_option');
		$this->data['text_checkout_account'] = $this->language->get('text_checkout_account');
		$this->data['text_checkout_payment_address'] = $this->language->get('text_checkout_payment_address');
		$this->data['text_checkout_shipping_address'] = $this->language->get('text_checkout_shipping_address');
		$this->data['text_checkout_shipping_method'] = $this->language->get('text_checkout_shipping_method');
		$this->data['text_checkout_payment_method'] = $this->language->get('text_checkout_payment_method');		
		$this->data['text_checkout_confirm'] = $this->language->get('text_checkout_confirm');
		$this->data['text_modify'] = $this->language->get('text_modify');

		$this->data['logged'] = $this->customer->isLogged();
		$this->data['shipping_required'] = $this->cart->hasShipping();
		
		$this->data['action'] = $this->url->link('checkout/checkout');	
		
		//===================get cart======================================//
		$this->data['column_image'] = $this->language->get('column_image');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');
		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_price'] = $this->language->get('column_price');
		$this->data['column_total'] = $this->language->get('column_total');
		$this->load->model('tool/image');
		
		$points = $this->customer->getRewardPoints();

		$points_total = 0;
		foreach ($this->cart->getProducts() as $product) {
			if ($product['points']) {
					$points_total += $product['points'];
				}
		}	
		$this->data['products'] = array();

		$products = $this->cart->getProducts();

		foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$this->data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];
					} else {
						$filename = $this->encryption->decrypt($option['option_value']);

						$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}

				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
				} else {
					$total = false;
				}

				$profile_description = '';

				/*if ($product['recurring']) {
					$frequencies = array(
						'day' => $this->language->get('text_day'),
						'week' => $this->language->get('text_week'),
						'semi_month' => $this->language->get('text_semi_month'),
						'month' => $this->language->get('text_month'),
						'year' => $this->language->get('text_year'),
					);

					if ($product['recurring_trial']) {
						$recurring_price = $this->currency->format($this->tax->calculate($product['recurring_trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')));
						$profile_description = sprintf($this->language->get('text_trial_description'), $recurring_price, $product['recurring_trial_cycle'], $frequencies[$product['recurring_trial_frequency']], $product['recurring_trial_duration']) . ' ';
					}

					$recurring_price = $this->currency->format($this->tax->calculate($product['recurring_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')));

					if ($product['recurring_duration']) {
						$profile_description .= sprintf($this->language->get('text_payment_description'), $recurring_price, $product['recurring_cycle'], $frequencies[$product['recurring_frequency']], $product['recurring_duration']);
					} else {
						$profile_description .= sprintf($this->language->get('text_payment_until_canceled_description'), $recurring_price, $product['recurring_cycle'], $frequencies[$product['recurring_frequency']], $product['recurring_duration']);
					}
				}*/

				$this->data['products'][] = array(
					'key'                 => $product['key'],
					'thumb'               => $image,
					'name'                => $product['name'],
					'model'               => $product['model'],
					'option'              => $option_data,
					'quantity'            => $product['quantity'],
					'stock'               => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'              => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'price'               => $price,
					'total'               => $total,
					'href'                => $this->url->link('product/product', 'product_id=' . $product['product_id']),
					'remove'              => $this->url->link('checkout/cart', 'remove=' . $product['key']),
					//'recurring'           => $product['recurring'],
					//'profile_name'        => $product['profile_name'],
					'profile_description' => $profile_description,
				);
			}


			//$this->data['products_recurring'] = array();*/

			// Gift Voucher
			$this->data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$this->data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount']),
						'remove'      => $this->url->link('checkout/cart', 'remove=' . $key)   
					);
				}
			}

			if (isset($this->request->post['next'])) {
				$this->data['next'] = $this->request->post['next'];
			} else {
				$this->data['next'] = '';
			}

			$this->data['coupon_status'] = $this->config->get('coupon_status');

			if (isset($this->request->post['coupon'])) {
				$this->data['coupon'] = $this->request->post['coupon'];			
			} elseif (isset($this->session->data['coupon'])) {
				$this->data['coupon'] = $this->session->data['coupon'];
			} else {
				$this->data['coupon'] = '';
			}

			$this->data['voucher_status'] = $this->config->get('voucher_status');

			if (isset($this->request->post['voucher'])) {
				$this->data['voucher'] = $this->request->post['voucher'];				
			} elseif (isset($this->session->data['voucher'])) {
				$this->data['voucher'] = $this->session->data['voucher'];
			} else {
				$this->data['voucher'] = '';
			}

			$this->data['reward_status'] = ($points && $points_total && $this->config->get('reward_status'));

			if (isset($this->request->post['reward'])) {
				$this->data['reward'] = $this->request->post['reward'];				
			} elseif (isset($this->session->data['reward'])) {
				$this->data['reward'] = $this->session->data['reward'];
			} else {
				$this->data['reward'] = '';
			}
		    // Totals
			$this->load->model('setting/extension');

			$total_data = array();					
			$total = 0;
			$taxes = $this->cart->getTaxes();

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$sort_order = array(); 

				$results = $this->model_setting_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('total/' . $result['code']);

						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
					}

					$sort_order = array(); 

					foreach ($total_data as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $total_data);			
				}
			}

			$this->data['totals'] = $total_data;
			// $this->session->data['totals'] = $total_data;
		//=========================end cart==================================//
		
		//=========================insert order==============================//
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$customer_info = $this->request->post;
				$data = array();
				if ($this->customer->isLogged()) {
					$data['customer_id'] = $this->customer->getId();
					$data['customer_group_id'] = $this->customer->getCustomerGroupId();
					$data['firstname'] = $this->customer->getFirstName();
					$data['lastname'] = $this->customer->getLastName();
					$data['email'] = $this->customer->getEmail();
					$data['telephone'] = $this->customer->getTelephone();
					$data['fax'] = $this->customer->getFax();
				} elseif ($customer_info) {
					$data['customer_id'] = 0;
					$data['customer_group_id'] = 1;
					$data['firstname'] = $customer_info['firstname'];
					$data['lastname'] = $customer_info['lastname'];
					$data['email'] = $customer_info['email'];
					$data['telephone'] = $customer_info['telephone'];
					$data['fax'] = '';
				}
				//=====================get country name======================//
				$country_name_array = $this->model_localisation_country->getCountry($customer_info['country_id']);
				if($country_name_array)
				$country_name = $country_name_array['name'];
				else
				$country_name = '';
				//=====================get zone name======================//
				$zone_name_array = $this->model_localisation_zone->getZone($customer_info['zone_id']);
				if($zone_name_array)
				$zone_name = $zone_name_array['name'];
				else
				$zone_name = '';
				
				$data['payment_firstname'] = $customer_info['firstname'];
				$data['payment_lastname'] = $customer_info['lastname'];	
				$data['payment_middlename'] = $customer_info['middlename'];	
				$data['payment_company'] = $customer_info['company'];	
				$data['payment_company_id'] = $customer_info['company_id'];	
				$data['payment_tax_id'] = $customer_info['tax_id'];	
				$data['payment_address_1'] = $customer_info['address_1'];
				$data['payment_address_2'] = $customer_info['address_2'];
				$data['payment_city'] = $customer_info['city'];
				$data['payment_postcode'] = $customer_info['postcode'];
				$data['payment_zone'] = $zone_name;
				$data['payment_zone_id'] = $customer_info['zone_id'];
				$data['payment_country'] = $country_name;
				$data['payment_country_id'] = $customer_info['country_id'];
				$data['payment_address_format'] = '';
			
			
			if (isset($customer_info['payment_method'])) {
				$data['payment_method'] = $customer_info['payment_method'];
			} else {
				$data['payment_method'] = '';
			}
			
			if (isset($customer_info['code'])) {
				$data['payment_code'] = $customer_info['code'];
			} else {
				$data['payment_code'] = 'cod';
			}
			//===================shipping==================//
			$data['shipping_firstname'] = '';
			$data['shipping_lastname'] = '';	
			$data['shipping_company'] = '';	
			$data['shipping_address_1'] = '';
			$data['shipping_address_2'] = '';
			$data['shipping_city'] = '';
			$data['shipping_postcode'] = '';
			$data['shipping_zone'] = '';
			$data['shipping_zone_id'] = '';
			$data['shipping_country'] = '';
			$data['shipping_country_id'] = '';
			$data['shipping_address_format'] = '';
			$data['shipping_method'] = $customer_info['shipping_method'];
			$data['shipping_code'] = $customer_info['shipping_method'];
			// Validate minimum quantity requirments.	
			
			$total_data = array();
			$total = 0;
			$taxes = $this->cart->getTaxes();
			 
			$this->load->model('setting/extension');
			
			$sort_order = array(); 
			
			$results = $this->model_setting_extension->getExtensions('total');
			
			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}
			
			array_multisort($sort_order, SORT_ASC, $results);
			
			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);
		
					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}
			
			$sort_order = array(); 
		  
			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
	
			array_multisort($sort_order, SORT_ASC, $total_data);
					
			$product_data = array();
		
			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();
	
				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];	
					} else {
						$value = $this->encryption->decrypt($option['option_value']);
					}	
					
					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],								   
						'name'                    => $option['name'],
						'value'                   => $value,
						'type'                    => $option['type']
					);					
				}
	 
				$product_data[] = array(
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $product['price'],
					'total'      => $product['total'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				); 
			}

			// Gift Voucher
			$voucher_data = array();
			
			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$voucher_data[] = array(
						'description'      => $voucher['description'],
						'code'             => substr(md5(mt_rand()), 0, 10),
						'to_name'          => $voucher['to_name'],
						'to_email'         => $voucher['to_email'],
						'from_name'        => $voucher['from_name'],
						'from_email'       => $voucher['from_email'],
						'voucher_theme_id' => $voucher['voucher_theme_id'],
						'message'          => $voucher['message'],						
						'amount'           => $voucher['amount']
					);
				}
			}  
						
			$data['products'] = $product_data;
			$data['vouchers'] = $voucher_data;
			$data['totals'] = $total_data;
			$data['comment'] = $customer_info['comment'];
			$data['total'] = $total;
			
			if (isset($this->request->cookie['tracking'])) {
				$this->load->model('affiliate/affiliate');
				
				$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
				$subtotal = $this->cart->getSubTotal();
				
				if ($affiliate_info) {
					$data['affiliate_id'] = $affiliate_info['affiliate_id']; 
					$data['commission'] = ($subtotal / 100) * $affiliate_info['commission']; 
				} else {
					$data['affiliate_id'] = 0;
					$data['commission'] = 0;
				}
			} else {
				$data['affiliate_id'] = 0;
				$data['commission'] = 0;
			}
						
			$data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
			$data['store_id'] = $this->config->get('config_store_id');
			$data['store_name'] = $this->config->get('config_name');
				
			if ($data['store_id']) {
				$data['store_url'] = $this->config->get('config_url');		
			} else {
				$data['store_url'] = HTTP_SERVER;	
			}
		

			$data['language_id'] = $this->config->get('config_language_id');
			$data['currency_id'] = $this->currency->getId();
			$data['currency_code'] = $this->currency->getCode();
			$data['currency_value'] = $this->currency->getValue($this->currency->getCode());
			$data['ip'] = $this->request->server['REMOTE_ADDR'];
			
			if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
				$data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];	
			} elseif(!empty($this->request->server['HTTP_CLIENT_IP'])) {
				$data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];	
			} else {
				$data['forwarded_ip'] = '';
			}
			
			if (isset($this->request->server['HTTP_USER_AGENT'])) {
				$data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];	
			} else {
				$data['user_agent'] = '';
			}
			
			if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
				$data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];	
			} else {
				$data['accept_language'] = '';
			}
			// print_r($data);
			// exit;

			// $this->load->model('catalog/product');		
	  //       $product_info2 = $this->model_catalog_product->getProductPricesById($product['product_id']);

			$this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);
			$order_id = $this->session->data['order_id'];
			$this->model_checkout_order->confirm($order_id,1,$customer_info['comment'], $notify = false);

			if($_COOKIE['tracking']){
				$this->load->model('affiliate/affiliate');
				$this->model_affiliate_affiliate->pushCountOrderingByCode($_COOKIE['tracking']);
			}

			if( $this->customer->isLogged() && $this->session->data['balans_noformat'] > 0 && $this->request->get['b'] == "ok") {

	            if( $this->session->data['balans_noformat'] > $this->data['totals'][1]['value']) {

	               $sum_pay = $this->data['totals'][1]['value'];
	               $this->load->model('module/statisticsmyaffiliate');
				   $balans_tabl = $this->model_module_statisticsmyaffiliate->getBalansAff($this->session->data['affiliate_id']);
				   $balans_for_pay = $balans_tabl - $sum_pay;
   	               $this->model_module_statisticsmyaffiliate->addTransaction($this->session->data['affiliate_id'],$this->session->data['name_fam'],$sum_pay, $balans_for_pay);
				   $balans_tabl = $this->model_module_statisticsmyaffiliate->updateBalansAff($this->session->data['affiliate_id'], $balans_for_pay);



	           } elseif( $this->session->data['balans_noformat'] < $this->data['totals'][1]['value']){

	              // $this->session->data['balans_noformat'];
	               $this->load->model('module/statisticsmyaffiliate');
	               $this->model_module_statisticsmyaffiliate->updateBalansAff($this->session->data['affiliate_id'], 0);
	               $this->model_module_statisticsmyaffiliate->addTransaction($this->session->data['affiliate_id'],$this->session->data['name_fam'],$this->session->data['balans_noformat']);
	          
	           }
            }

			unset($this->session->data['cart']);
			$this->redirect($this->url->link('checkout/success', '', 'SSL'));
		}
		//=========================end insert order==========================//
		//===================guest=======================================//
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_your_details'] = $this->language->get('text_your_details');
		$this->data['text_your_account'] = $this->language->get('text_your_account');
		$this->data['text_your_address'] = $this->language->get('text_your_address');

		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_fax'] = $this->language->get('entry_fax');
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_company_id'] = $this->language->get('entry_company_id');
		$this->data['entry_tax_id'] = $this->language->get('entry_tax_id');			
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_address_2'] = $this->language->get('entry_address_2');
		$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['entry_shipping'] = $this->language->get('entry_shipping');

		$this->data['button_continue'] = $this->language->get('button_continue');
		
		if (isset($this->error['firstname'])) {
			$this->data['error_firstname'] = $this->error['firstname'];
		} else {
			$this->data['error_firstname'] = '';
		}
		
		if (isset($this->error['lastname'])) {
			$this->data['error_lastname'] = $this->error['lastname'];
		} else {
			$this->data['error_lastname'] = '';
		}	
		
		if (isset($this->error['telephone'])) {
			$this->data['error_telephone'] = $this->error['telephone'];
		} else {
			$this->data['error_telephone'] = '';
		}
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}
		
		if (isset($this->error['address_1'])) {
			$this->data['error_address_1'] = $this->error['address_1'];
		} else {
			$this->data['error_address_1'] = '';
		}
		
		if (isset($this->error['postcode'])) {
			$this->data['error_postcode'] = $this->error['postcode'];
		} else {
			$this->data['error_postcode'] = '';
		}
		
		if (isset($this->error['country'])) {
			$this->data['error_country'] = $this->error['country'];
		} else {
			$this->data['error_country'] = '';
		}
		
		if (isset($this->error['zone'])) {
			$this->data['error_zone'] = $this->error['zone'];
		} else {
			$this->data['error_zone'] = '';
		}						
		
		if ($this->customer->isLogged() && $this->customer->getAddressId()) {					
			$customer_address = $this->model_account_address->getAddress($this->customer->getAddressId());	
		}

		// print_r($_POST);
		// exit;
		
		if (isset($this->request->post['firstname'])) {
			$this->data['firstname'] = $this->request->post['firstname'];
		} elseif ($this->customer->isLogged()) { 
			$this->data['firstname'] = $this->customer->getFirstName();
		} else {
			$this->data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$this->data['lastname'] = $this->request->post['lastname'];
		} elseif ($this->customer->isLogged()) { 
			$this->data['lastname'] = $this->customer->getLastName();
		} else {
			$this->data['lastname'] = '';
		}

		if (isset($this->request->post['middlename'])) {
			$this->data['middlename'] = $this->request->post['middlename'];
		} elseif ($this->customer->isLogged()) { 
			$this->data['middlename'] = $this->customer->getLastMiddleName();
		} else {
			$this->data['middlename'] = '';
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} elseif ($this->customer->isLogged()) { 
			$this->data['email'] = $this->customer->getEmail();
		} else {
			$this->data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$this->data['telephone'] = $this->request->post['telephone'];		
		} elseif ($this->customer->isLogged()) { 
			$this->data['telephone'] = $this->customer->getTelephone();
		} else {
			$this->data['telephone'] = '';
		}

		if (isset($this->request->post['fax'])) {
			$this->data['fax'] = $this->request->post['fax'];				
		} elseif ($this->customer->isLogged()) { 
			$this->data['fax'] = $this->customer->getFax();
		} else {
			$this->data['fax'] = '';
		}

		if (isset($this->request->post['company'])) {
			$this->data['company'] = $this->request->post['company'];			
		} elseif(isset($customer_address) && $customer_address){
			$this->data['company'] = $customer_address['company'];	
		} else {
			$this->data['company'] = '';
		}

		$this->load->model('account/customer_group');

		$this->data['customer_groups'] = array();

		if (is_array($this->config->get('config_customer_group_display'))) {
			$customer_groups = $this->model_account_customer_group->getCustomerGroups();

			foreach ($customer_groups as $customer_group) {
				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$this->data['customer_groups'][] = $customer_group;
				}
			}
		}

		if (isset($this->request->post['customer_group_id'])) {
			$this->data['customer_group_id'] = $this->request->post['customer_group_id'];
		} elseif ($this->customer->isLogged()) { 
			$this->data['customer_group_id'] = $this->customer->getCustomerGroupId();
		} else {
			$this->data['customer_group_id'] = $this->config->get('config_customer_group_id');
		}

		// Company ID
		if (isset($this->request->post['company_id'])) {
			$this->data['company_id'] = $this->request->post['company_id'];			
		} elseif(isset($customer_address) && $customer_address){
			$this->data['company_id'] = $customer_address['company_id'];	
		} else {
			$this->data['company_id'] = '';
		}

		// Tax ID
		if (isset($this->request->post['tax_id'])) {
			$this->data['tax_id'] = $this->request->post['tax_id'];			
		} elseif(isset($customer_address) && $customer_address){
			$this->data['tax_id'] = $customer_address['tax_id'];	
		} else {
			$this->data['tax_id'] = '';
		}

		if (isset($this->request->post['address_1'])) {
			$this->data['address_1'] = $this->request->post['address_1'];			
		} elseif(isset($customer_address) && $customer_address){
			$this->data['address_1'] = $customer_address['address_1'];	
		} else {
			$this->data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$this->data['address_2'] = $this->request->post['address_2'];			
		} elseif(isset($customer_address) && $customer_address){
			$this->data['address_2'] = $customer_address['address_2'];	
		} else {
			$this->data['address_2'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$this->data['postcode'] = $this->request->post['postcode'];							
		} elseif(isset($customer_address) && $customer_address){
			$this->data['postcode'] = $customer_address['postcode'];	
		} else {
			$this->data['postcode'] = '';
		}

		if (isset($this->request->post['city'])) {
			$this->data['city'] = $this->request->post['city'];			
		} elseif(isset($customer_address) && $customer_address){
			$this->data['city'] = $customer_address['city'];	
		} else {
			$this->data['city'] = '';
		}

		if (isset($this->request->post['country_id'])) {
			$this->data['country_id'] = $this->request->post['country_id'];			  	
		} elseif(isset($customer_address) && $customer_address){
			$this->data['country_id'] = $customer_address['country_id'];	
		} else {
			$this->data['country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['zone_id'])) {
			$this->data['zone_id'] = $this->request->post['zone_id'];	
		} elseif(isset($customer_address) && $customer_address){
			$this->data['zone_id'] = $customer_address['zone_id'];	
		} else {
			$this->data['zone_id'] = '';
		}

		$this->data['countries'] = $this->model_localisation_country->getCountries();

		$this->data['shipping_required'] = $this->cart->hasShipping();
		
		//==================checkbox============================//
		if (isset($this->request->post['shipping_address'])) {
			$this->data['shipping_address'] = $this->request->post['shipping_address'];			
		} else {
			$this->data['shipping_address'] = true;
		}			
		//===================end guest===================================//
		
		//===================shipping method===============================//
		$this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
		$data= array();
		$data['firstname'] = $this->data['firstname'];
		$data['lastname'] = $this->data['lastname'];	
		$data['company'] = $this->data['company'];	
		$data['company_id'] = $this->data['company_id'];	
		$data['tax_id'] = $this->data['tax_id'];	
		$data['address_1'] = $this->data['address_1'];
		$data['address_2'] = $this->data['address_2'];
		$data['city'] = $this->data['city'];
		$data['postcode'] = $this->data['postcode'];
		$data['zone'] = '';
		$data['zone_id'] = $this->data['zone_id'];
		$data['country'] = '';
		$data['country_id'] = $this->data['country_id'];
		$shipping_address = $data;
		
		// Shipping Methods
			$quote_data = array();

			$this->load->model('setting/extension');

			$results = $this->model_setting_extension->getExtensions('shipping');

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('shipping/' . $result['code']);

					$quote = $this->{'model_shipping_' . $result['code']}->getQuote($shipping_address); 

					if ($quote) {
						$quote_data[$result['code']] = array( 
							'title'      => $quote['title'],
							'quote'      => $quote['quote'], 
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}

			$sort_order = array();

			foreach ($quote_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $quote_data);

			$this->data['shipping_methods'] = $quote_data;
			
		if (isset($this->request->post['payment_method'])) {
			$this->data['shipping_method_code'] = $this->request->post['shipping_method'];
		} else {
			$this->data['shipping_method_code'] = '';
		}	
		//===================end shipping method===========================//
		
		//===================payment method=================================//
		$this->load->model('account/address');
		$data= array();
		$data['firstname'] = $this->data['firstname'];
		$data['lastname'] = $this->data['lastname'];	
		$data['company'] = $this->data['company'];	
		$data['company_id'] = $this->data['company_id'];	
		$data['tax_id'] = $this->data['tax_id'];	
		$data['address_1'] = $this->data['address_1'];
		$data['address_2'] = $this->data['address_2'];
		$data['city'] = $this->data['city'];
		$data['postcode'] = $this->data['postcode'];
		$data['zone'] = '';
		$data['zone_id'] = $this->data['zone_id'];
		$data['country'] = '';
		$data['country_id'] = $this->data['country_id'];
		$payment_address = $data;

		if (!empty($payment_address)) {
			// Totals
			$total_data = array();					
			$total = 0;
			$taxes = $this->cart->getTaxes();

			$this->load->model('setting/extension');

			$sort_order = array(); 

			$results = $this->model_setting_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}

			// Payment Methods
			$method_data = array();

			$this->load->model('setting/extension');

			$results = $this->model_setting_extension->getExtensions('payment');

			//$cart_has_recurring = $this->cart->hasRecurringProducts();

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('payment/' . $result['code']);

					$method = $this->{'model_payment_' . $result['code']}->getMethod($payment_address, $total);

					/*if ($method) {
						if($cart_has_recurring > 0){
							if (method_exists($this->{'model_payment_' . $result['code']},'recurringPayments')) {
								if($this->{'model_payment_' . $result['code']}->recurringPayments() == true){
									$method_data[$result['code']] = $method;
								}
							}
						} else {
							$method_data[$result['code']] = $method;
						}
					}*/
				}
			}

			$sort_order = array(); 

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);			

			$this->data['payment_methods'] = $method_data;	

		}
		
		$this->data['text_payment_method'] = $this->language->get('text_payment_method');
		$this->data['text_comments'] = $this->language->get('text_comments');
		
		
		if (isset($this->request->post['payment_method'])) {
			$this->data['payment_method_code'] = $this->request->post['payment_method'];
		} else {
			$this->data['payment_method_code'] = '';
		}

		if (isset($this->request->post['comment'])) {
			$this->data['comment'] = $this->request->post['comment'];
		} else {
			$this->data['comment'] = '';
		}
		
		//======================end payment method=========================//
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/checkout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/checkout.tpl';
		} else {
			$this->template = 'default/template/checkout/checkout.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/lk_name',
			'common/footer',
			'common/header'	
		);

		if (isset($this->request->get['quickconfirm'])) {
			$this->data['quickconfirm'] = $this->request->get['quickconfirm'];
		}

		$this->response->setOutput($this->render());
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}

		$this->response->setOutput(json_encode($json));
	}
	public function validate() {
		$this->language->load('checkout/checkout');

			if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
				$this->error['firstname'] = $this->language->get('error_firstname');
			}

			if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
				$this->error['lastname'] = $this->language->get('error_lastname');
			}

			if ((utf8_strlen($this->request->post['middlename']) < 1) || (utf8_strlen($this->request->post['middlename']) > 32)) {
				$this->data['error_middlename'] = "Отчество должно содержать от 1 до 32 симоволов";
			}

			if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
				$this->error['email'] = $this->language->get('error_email');
			}

			if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
				$this->error['telephone'] = $this->language->get('error_telephone');
			}

			// Customer Group
			$this->load->model('account/customer_group');

			if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
				$customer_group_id = $this->request->post['customer_group_id'];
			} else {
				$customer_group_id = $this->config->get('config_customer_group_id');
			}

			// $customer_group = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

			// if ($customer_group) {	
			// 	// Company ID
			// 	if ($customer_group['company_id_display'] && $customer_group['company_id_required'] && empty($this->request->post['company_id'])) {
			// 		$this->error['company_id'] = $this->language->get('error_company_id');
			// 	}

			// 	// Tax ID
			// 	if ($customer_group['tax_id_display'] && $customer_group['tax_id_required'] && empty($this->request->post['tax_id'])) {
			// 		$this->error['tax_id'] = $this->language->get('error_tax_id');
			// 	}						
			// }

			if ((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 128)) {
				$this->error['address_1'] = $this->language->get('error_address_1');
			}

			if ( (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
				$this->error['postcode'] = $this->language->get('error_postcode');
			}


			// if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) {
			// 	$this->error['city'] = $this->language->get('error_city');
			// }

			// $this->load->model('localisation/country');

			// $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

			// if ($country_info) {
			// 	if ($country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
			// 		$this->error['postcode'] = $this->language->get('error_postcode');
			// 	}

			// 	// VAT Validation
			// 	$this->load->helper('vat');

			// 	if ($this->config->get('config_vat') && $this->request->post['tax_id'] && (vat_validation($country_info['iso_code_2'], $this->request->post['tax_id']) == 'invalid')) {
			// 		$this->error['tax_id'] = $this->language->get('error_vat');
			// 	}					
			// }

			// if ($this->request->post['country_id'] == '') {
			// 	$this->error['country'] = $this->language->get('error_country');
			// }

			// if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
			// 	$this->error['zone'] = $this->language->get('error_zone');
			// }	
	
		
		if (!$this->error) {
      		return true;
    	} else {
      		return false;
    	}
	}

	// public function zone() {
	// 	$output = '<option value="">' . $this->language->get('text_select') . '</option>';

	// 	$this->load->model('localisation/zone');

	// 	$results = $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']);

	// 	foreach ($results as $result) {
	// 		$output .= '<option value="' . $result['zone_id'] . '"';

	// 		if (isset($this->request->get['zone_id']) && ($this->request->get['zone_id'] == $result['zone_id'])) {
	// 			$output .= ' selected="selected"';
	// 		}

	// 		$output .= '>' . $result['name'] . '</option>';
	// 	}

	// 	if (!$results) {
	// 		$output .= '<option value="0">' . $this->language->get('text_none') . '</option>';
	// 	}

	// 	$this->response->setOutput($output);
	// }
}
?>