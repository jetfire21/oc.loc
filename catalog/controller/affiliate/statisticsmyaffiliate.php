<?php
class ControllerAffiliateStatisticsmyaffiliate extends Controller {

    public function index() {
        if (!$this->affiliate->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('affiliate/statisticsmyaffiliate', '', 'SSL');
            $this->redirect($this->url->link('affiliate/login', '', 'SSL'));
        }
		
        $this->language->load('affiliate/statisticsmyaffiliate');

        $this->document->setTitle($this->language->get('heading_title'));

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $this->redirect($this->url->link('affiliate/account', '', 'SSL'));
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('affiliate/account', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_statistics'),
            'href' => $this->url->link('affiliate/statisticsmyaffiliate', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        if (isset($this->request->get['filter_date_start'])) {
            $filter_date_start = $this->request->get['filter_date_start'];
        } else {
            $filter_date_start = '';
        }

        if (isset($this->request->get['filter_date_end'])) {
            $filter_date_end = $this->request->get['filter_date_end'];
        } else {
            $filter_date_end = '';
        }

        $url = '';

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }

        $data = array(
            'filter_date_start' => $filter_date_start,
            'filter_date_end' => $filter_date_end
        );

        $this->data['entry_date_start'] = $this->language->get('entry_date_start');
        $this->data['entry_date_end'] = $this->language->get('entry_date_end');

        $this->data['button_filter'] = $this->language->get('button_filter');
        $this->data['button_clear'] = $this->language->get('button_clear');
        $url = '';

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data = array(
			'start' => ($page - 1) * 10,
			'limit' => 10
		);	
		
        $this->data['filter_date_start'] = $filter_date_start;
        $this->data['filter_date_end'] = $filter_date_end;

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['entry_statistics'] = $this->language->get('entry_statistics');
        $this->data['column_count_transitions'] = $this->language->get('column_count_transitions');
        $this->data['column_count_orders'] = $this->language->get('column_count_orders');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_level'] = $this->language->get('column_level');
        $this->data['column_count_shopping'] = $this->language->get('column_count_shopping');
        $this->data['column_sum_orders'] = $this->language->get('column_sum_orders');
        $this->data['column_sum_shopping'] = $this->language->get('column_sum_shopping');
        $this->data['column_sum_credited'] = $this->language->get('column_sum_credited');
        $this->data['column_sum_paid'] = $this->language->get('column_sum_paid');
        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_back'] = $this->language->get('button_back');
        $this->data['text_no_results'] = $this->language->get('text_no_results');
        $this->data['action'] = $this->url->link('affiliate/statisticsmyaffiliate', '', 'SSL');
		
		$this->load->model('module/statisticsmyaffiliate');
		$getlevel = $this->config->get('affiliate_level_commission');
        $levelcount = count($getlevel);
		$implode = array();
		$implode[] = "parent = '" . $this->affiliate->getId() . "'";
		$training = $this->model_module_statisticsmyaffiliate->getAffiliatesChildren($implode, $levelcount);
		$results = '';
		if(strlen($training)) {
			$results = $this->model_module_statisticsmyaffiliate->getChildrenLevel($training, $levelcount);
			foreach ($results as $result) {
				$affiliate_name  = $this->model_module_statisticsmyaffiliate->getAffiliatesName($result['affiliate_id']);
				$resultOrders = $this->model_module_statisticsmyaffiliate->GetStatisticsOrders($result['affiliate_id'], $this->data);
				$resultShopping =  $this->model_module_statisticsmyaffiliate->GetStatisticsShopping($result['affiliate_id'], $this->data);
				$resultSum = $this->model_module_statisticsmyaffiliate->GetStatisticsSum($this->affiliate->getId(), $result['affiliate_id'], $this->data);
				$this->data['affiliates'][] = array(
					'level' =>  $result['level'],
					'affiliate' =>  $affiliate_name,
					'count_orders' => (int)$resultOrders['count_orders'],
					'count_shopping' => (int)$resultShopping['count_shopping'],
					'sum_orders' => $this->currency->format($resultOrders['sum_orders'], $this->config->get('config_currency')),
					'sum_shopping' => $this->currency->format($resultShopping['sum_shopping'], $this->config->get('config_currency')),
					'commission' => $this->currency->format($resultSum['commission'], $this->config->get('config_currency'))
				);
			}
		}
		$transaction_total = count($results);
		
	    $pagination = new Pagination();
		$pagination->total = $transaction_total;
		$pagination->page = $page;
		$pagination->limit = 10; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('affiliate/statisticsmyaffiliate', 'page={page}', 'SSL');
		$this->data['pagination'] = $pagination->render();
		
        $this->data['back'] = $this->url->link('affiliate/account', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/statisticsmyaffiliate.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/affiliate/statisticsmyaffiliate.tpl';
        } else {
            $this->template = 'default/template/affiliate/statisticsmyaffiliate.tpl';
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