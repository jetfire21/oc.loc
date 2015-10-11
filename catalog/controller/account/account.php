<?php 
class ControllerAccountAccount extends Controller { 

	public function index() {
		if (!$this->customer->isLogged()) {
	  		$this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');
	  
	  		$this->redirect($this->url->link('account/login', '', 'SSL'));
    	} 

		$this->language->load('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	); 

      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
		if (isset($this->session->data['success'])) {
    		$this->data['success'] = $this->session->data['success'];
			
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_my_account'] = $this->language->get('text_my_account');
		$this->data['text_my_orders'] = $this->language->get('text_my_orders');
		$this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
    	$this->data['text_edit'] = $this->language->get('text_edit');
    	$this->data['text_password'] = $this->language->get('text_password');
    	$this->data['text_address'] = $this->language->get('text_address');
		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
    	$this->data['text_order'] = $this->language->get('text_order');
    	$this->data['text_download'] = $this->language->get('text_download');
		$this->data['text_reward'] = $this->language->get('text_reward');
		$this->data['text_return'] = $this->language->get('text_return');
		$this->data['text_transaction'] = $this->language->get('text_transaction');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');

    	$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
    	$this->data['password'] = $this->url->link('account/password', '', 'SSL');
		$this->data['address'] = $this->url->link('account/address', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist');
    	$this->data['order'] = $this->url->link('account/order', '', 'SSL');
    	$this->data['download'] = $this->url->link('account/download', '', 'SSL');
		$this->data['return'] = $this->url->link('account/return', '', 'SSL');
		$this->data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
		
		if ($this->config->get('reward_status')) {
			$this->data['reward'] = $this->url->link('account/reward', '', 'SSL');
		} else {
			$this->data['reward'] = '';
		}

		// ************************* мой код

		$this->load->model('account/customer');
		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		$address =  $this->model_account_customer->getCustomerAddress1($this->customer->getId());

		$this->load->model('module/statisticsmyaffiliate');
		$this->session->data['affiliate_id'] =  $this->model_module_statisticsmyaffiliate->getAffId($_SESSION['customer_id']);
		$this->session->data['balans'] = $this->model_module_statisticsmyaffiliate->getBalansAff($this->session->data['affiliate_id']);
		$this->session->data['balans_noformat'] = $this->session->data['balans'];
		$this->balans = $this->session->data['balans'];

		$this->session->data['balans'] = $this->currency->format($this->session->data['balans'] , $this->config->get('config_currency'));


		$this->data['customer_info'] = $customer_info;
		$this->session->data['name_fam'] = $customer_info['firstname'] ." ".$customer_info['lastname'];

		$this->data['address'] = $address;
		$this->data['link_account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['link_cart'] = $this->url->link('checkout/cart', '', 'SSL');
		// $data['address_1'] ="ddd";
		// echo $q = $this->model_account_customer->editCustomerAddress1($data);
		// exit;

		// print_r($this->data);
		// print_r($customer_info);
		print_r($_SESSION);

		// ************************* мой код
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/account.tpl';
		} else {
			$this->template = 'default/template/account/account.tpl';
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
				
		$this->response->setOutput($this->render());
  	}

  	public function referal(){

  		$this->load->model('account/customer');
		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		$this->data['customer_info'] = $customer_info;

		$this->template = $this->config->get('config_template') . '/template/account/referal.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/lk_name',
			'common/footer',
			'common/header'
		);
		$this->response->setOutput($this->render());
  	}



  	public function history(){

  		$this->load->model('account/customer');
		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		$this->data['customer_info'] = $customer_info;

		$this->load->model('affiliate/transaction');

		 $data['order'] = "DESC";
		$this->data['transactions'] = $this->model_affiliate_transaction->getTransactions($data);
		foreach ( $this->data['transactions'] as $k => $v) {
			// if($this->session->data['balans_noformat'] > 0 and $v['withdrawal'] == 1){
			// 	$ostatok = $this->session->data['balans_noformat'] - $v['amount'];
			// 	$this->data['transactions'][$k]['amount'] = $this->currency->format( $v['amount'] , $this->config->get('config_currency'));
			// }else{
			   $this->data['transactions'][$k]['amount'] = $this->currency->format( $v['amount'] , $this->config->get('config_currency'));
			   $this->data['transactions'][$k]['ostatok'] = $this->currency->format( $v['ostatok'] , $this->config->get('config_currency'));
			// }

			// $total_sum = $total_sum + $v['amount'];

	         $v['date_added'] = substr($v['date_added'],0,-3);
	         $temp = explode(" ", $v['date_added']);
	         $date = array_reverse(explode("-", $temp[0]));
	         $date = implode(".", $date);
	         $date .= " ".$temp[1];
	         $this->data['transactions'][$k]['date_added']  =  $date;
		}

		$this->load->model('module/statisticsmyaffiliate');
		$aff_info = $this->model_module_statisticsmyaffiliate->getAffiliate($this->session->data['affiliate_id']);

         $aff_info['date_added'] = substr($aff_info['date_added'],0,-3);
         $temp = explode(" ", $aff_info['date_added']);
         $date = array_reverse(explode("-", $temp[0]));
         $date = implode(".", $date);
         $date .= " ".$temp[1];
         $aff_info['date_added']  =  $date;

         // $aff_info['total_sum'] =  $aff_info['total_out'] + $this->session->data['balans_noformat'];
         // $aff_info['total_sum'] = $this->currency->format( $aff_info['total_sum'] , $this->config->get('config_currency'));
         // $aff_info['total_sum'] = $this->currency->format( $total_sum , $this->config->get('config_currency'));
         // $aff_info['total_out'] = $this->currency->format( $aff_info['total_out'] , $this->config->get('config_currency'));

 		 $total_sum = $this->model_affiliate_transaction->getTotalSumPay();
		 $total_out = $this->model_affiliate_transaction->getTotalSumOut();
		// echo '---------------';
         $aff_info['total_sum'] = $this->currency->format( $total_sum , $this->config->get('config_currency'));
        $aff_info['total_out'] = $this->currency->format( $total_out, $this->config->get('config_currency'));
        // echo '---------------';

         $this->data['affiliate_info'] = $aff_info;
		

		$this->template = $this->config->get('config_template') . '/template/account/history.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/lk_name',
			'common/footer',
			'common/header'
		);
		$this->response->setOutput($this->render());
  	}

  	 public function withdrawal(){
  	 	if($this->request->post['data']){

  	 		$res['balans'] = $this->session->data['balans_noformat'];

  	 		if($res['balans'] > 0){
  	 			$this->load->model('module/statisticsmyaffiliate');
			    $this->model_module_statisticsmyaffiliate->withdrawal($this->session->data['affiliate_id'],$this->session->data['name_fam'], $res['balans']);
			    $this->session->data['balans_noformat'] = 0;
			    $this->session->data['balans'] = "0 руб";
  	 			echo json_encode($res);
  	 		} else {
  	 			 $res['error'] = 1;
  	 			echo json_encode($res);
  	 		}
  	 	}

  	}

	public function structura(){
		$this->load->model('account/customer');
		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		$this->data['customer_info'] = $customer_info;

		$this->template = $this->config->get('config_template') . '/template/account/structura.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/lk_name',
			'common/footer',
			'common/header'
		);
		$this->response->setOutput($this->render());
  	}

	public function edit_profile(){

		if ($this->request->server['REQUEST_METHOD'] == 'POST' )
		 {

	  		$this->language->load('account/edit');
	  		$this->language->load('account/password');
	  		$this->load->model('account/customer');

	  		if($_POST['firstname']){
				if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
					$error['error_firstname'] = $this->language->get('error_firstname');
				}else{
					$data['firstname'] = $this->request->post['firstname'];
				}
			}

			if($_POST['lastname']){
				if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
					$error['error_lastname']  = $this->language->get('error_lastname');
				}
				else{
					$data['lastname'] = $this->request->post['lastname'];
				}
			}
			
			if($_POST['middlename']){
				if ((utf8_strlen($this->request->post['middlename']) < 1) || (utf8_strlen($this->request->post['middlename']) > 32)) {
					$error['error_middlename']  = "Отчество должно быть от 1 до 32 символов!";
				}
				else{
					$data['middlename'] = $this->request->post['middlename'];
				}
			}
			
			if($_POST['address_1']){
				if ((utf8_strlen($this->request->post['address_1']) < 1) || (utf8_strlen($this->request->post['address_1']) > 256)) {
					$error['error_address_1']  = "Адрес должен содержать от 1 до 255 символов!";
				}
				else{
					$data['address_1'] = $this->request->post['address_1'];
				}
			}

			if($_POST['email']){
				if ((utf8_strlen($this->request->post['email']) > 96) || !$this->ocstore->validate($this->request->post['email'])) {
					$error['error_email'] = $this->language->get('error_email');
				}
				else{
					if ( $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email']) > 0 ) {
						$error['error_email'] = $this->language->get('error_exists');
					}else{
						$data['email'] = $this->request->post['email'];
					}

				}
			}

			if($_POST['telephone']){
				if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
					$error['error_telephone'] = $this->language->get('error_telephone');
				}
				else{
					$data['telephone'] = $this->request->post['telephone'];
				}
			}

			if($_POST['postcode']){
				if ( (int)(utf8_strlen($this->request->post['postcode']) < 5) ||  (int)(utf8_strlen($this->request->post['postcode']) > 7)) {
					$error['error_postcode'] = "почтовый индекс должен содержать от 5 до 7 цифр";
				}
				else{
					$data['postcode'] = $this->request->post['postcode'];
				}
			}

	    	if($_POST['password']){
		    	if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
		      		$error['error_password'] = $this->language->get('error_password');
		    	}else{
					$data['password'] = $this->request->post['password'];
				}
		    }


	    	// if ($this->request->post['confirm'] != $this->request->post['password']) {
	     //  		$this->error['confirm'] = $this->language->get('error_confirm');
	    	// } 


			if(!$error){
				if($data['firstname'])	$this->model_account_customer->editCustomerName($data);
				if($data['lastname'])	$this->model_account_customer->editCustomerFam($data);
				if($data['telephone'])	$this->model_account_customer->editCustomerPhone($data);
				if($data['email'])	$this->model_account_customer->editCustomerEmail($data);
				if($data['postcode'])	$this->model_account_customer->editCustomerPostcode($data);
				if($data['password'])	$this->model_account_customer->editPassword($data);
				if($data['middlename'])	$this->model_account_customer->editCustomerMiddleName($data);
				if($data['address_1'])	$q = $this->model_account_customer->editCustomerAddress1($data);
				
				$data['success'] = "ok";
				$data['q'] = $q;
				echo json_encode($data);
			}
			 else{
			  	echo json_encode($error);
			 }

		}

	}

}
?>