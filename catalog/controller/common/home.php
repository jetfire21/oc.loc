<?php  
class ControllerCommonHome extends Controller {
	public function index() {

		// ********** my  ****************

		$this->load->model('catalog/product');
		$this->data['all_products'] = $this->model_catalog_product->MYgetProducts();
		$this->data['products_topakses'] = $this->model_catalog_product->getProductsTopAkses();

		$this->data['base'] = $this->config->get('config_url');
		 $this->load->model('catalog/news');
		$this->data['only_home_news'] = $this->model_catalog_news->getNewsShorts(1);
		$news_id = $this->data['only_home_news'][0]['news_id'];
		$this->data['only_home_news'][0]['href'] = $this->url->link('information/news', 'news_id=' . $news_id);

		// ********** my  ****************

		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
															
		$this->response->setOutput($this->render());
	}
}
?>