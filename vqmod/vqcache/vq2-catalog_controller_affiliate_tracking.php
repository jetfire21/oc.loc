<?php 
class ControllerAffiliateTracking extends Controller { 
	public function index() {

		// if (!$this->affiliate->isLogged()) {
	 //  		$this->session->data['redirect'] = $this->url->link('affiliate/tracking', '', 'SSL');
	  
	 //  		$this->redirect($this->url->link('affiliate/login', '', 'SSL'));
  //   	} 
		
		if (!$this->session->data['customer_id']) {
	  		$this->session->data['redirect'] = $this->url->link('affiliate/tracking', '', 'SSL');
	  
	  		$this->redirect($this->url->link('common/home', '', 'SSL'));
    	} 
	
		$this->language->load('affiliate/tracking');

		$this->document->setTitle($this->language->get('heading_title'));

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	); 

      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('affiliate/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);

      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('affiliate/tracking', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

			
				$this->data['button_vk'] = $this->language->get('button_vk');
				$this->load->model('module/statisticsmyaffiliate');
				$this->data['register'] = $this->model_module_statisticsmyaffiliate->getRegUrl();
				$this->data['text_register_url'] = $this->language->get('text_register_url');
			
            
		
		$this->data['text_description'] = sprintf($this->language->get('text_description'), $this->config->get('config_name'));
		$this->data['text_code'] = $this->language->get('text_code');
		$this->data['text_generator'] = $this->language->get('text_generator');
		$this->data['text_link'] = $this->language->get('text_link');
		
		$this->data['button_continue'] = $this->language->get('button_continue');

    	$this->data['code'] = $this->affiliate->getCode();
		
		$this->data['continue'] = $this->url->link('affiliate/account', '', 'SSL');

		$this->load->model('module/statisticsmyaffiliate');
		$this->data['aff_info'] = $this->model_module_statisticsmyaffiliate->getAffiliate($this->session->data['affiliate_id']);
		// print_r($aff_info);
		// exit;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/tracking.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/affiliate/tracking.tpl';
		} else {
			$this->template = 'default/template/affiliate/tracking.tpl';
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
	
	public function autocomplete() {
		$json = array();
		
		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/product');
			 
			$data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);
			
			$results = $this->model_catalog_product->getProducts($data);
			
			foreach ($results as $result) {
				$json[] = array(
					'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'link' => str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $result['product_id'] . '&tracking=' . $this->affiliate->getCode()))			
				);	
			}
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>