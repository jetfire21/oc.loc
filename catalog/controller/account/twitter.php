<?php 

class ControllerAccountTwitter extends Controller {

	      
  	public function index() {

  		// определяем изначальные конфигурационные данные

		define('CONSUMER_KEY', 'tm8ohcIzLxrPws4m4QuLFANa6');
		define('CONSUMER_SECRET', 'FMAtWJgY63yvbQWOPKZ9DZpLoSKKhEjHpb7td7pXdkyCDwiXHm');

		define('REQUEST_TOKEN_URL', 'https://api.twitter.com/oauth/request_token');
		define('AUTHORIZE_URL', 'https://api.twitter.com/oauth/authorize');
		define('ACCESS_TOKEN_URL', 'https://api.twitter.com/oauth/access_token');
		define('ACCOUNT_DATA_URL', 'https://api.twitter.com/1.1/users/show.json');

		// добавить в бд таблицу ul_alias account/twitter => account-twitter
		// define('CALLBACK_URL', $this->config->get('config_url')."account-twitter");
		define('CALLBACK_URL', $this->url->link("account/twitter"));


		// формируем подпись для получения токена доступа
		define('URL_SEPARATOR', '&');

		$oauth_nonce = md5(uniqid(rand(), true));
		$oauth_timestamp = time();

		$params = array(
		    'oauth_callback=' . urlencode(CALLBACK_URL) . URL_SEPARATOR,
		    'oauth_consumer_key=' . CONSUMER_KEY . URL_SEPARATOR,
		    'oauth_nonce=' . $oauth_nonce . URL_SEPARATOR,
		    'oauth_signature_method=HMAC-SHA1' . URL_SEPARATOR,
		    'oauth_timestamp=' . $oauth_timestamp . URL_SEPARATOR,
		    'oauth_version=1.0'
		);

		$oauth_base_text = implode('', array_map('urlencode', $params));
		$key = CONSUMER_SECRET . URL_SEPARATOR;
		$oauth_base_text = 'GET' . URL_SEPARATOR . urlencode(REQUEST_TOKEN_URL) . URL_SEPARATOR . $oauth_base_text;
		$oauth_signature = base64_encode(hash_hmac('sha1', $oauth_base_text, $key, true));


		// получаем токен запроса
		$params = array(
		    URL_SEPARATOR . 'oauth_consumer_key=' . CONSUMER_KEY,
		    'oauth_nonce=' . $oauth_nonce,
		    'oauth_signature=' . urlencode($oauth_signature),
		    'oauth_signature_method=HMAC-SHA1',
		    'oauth_timestamp=' . $oauth_timestamp,
		    'oauth_version=1.0'
		);
		$url = REQUEST_TOKEN_URL . '?oauth_callback=' . urlencode(CALLBACK_URL) . implode('&', $params);

		$response = file_get_contents($url);
		parse_str($response, $response);

		$oauth_token = $response['oauth_token'];
		$oauth_token_secret = $response['oauth_token_secret'];


		// генерируем ссылку аутентификации
		// https://api.twitter.com/oauth/authorize?oauth_token=n9JtxwAAAAAAiMNIAAABUHyVFpI
		$link = AUTHORIZE_URL . '?oauth_token=' . $oauth_token;

		if( !$_GET['oauth_token']) header("Location:".$link);


		if (!empty($_GET['oauth_token']) && !empty($_GET['oauth_verifier'])) {
		    // готовим подпись для получения токена доступа

		    $oauth_nonce = md5(uniqid(rand(), true));
		    $oauth_timestamp = time();
		    $oauth_token = $_GET['oauth_token'];
		    $oauth_verifier = $_GET['oauth_verifier'];


		    $oauth_base_text = "GET&";
		    $oauth_base_text .= urlencode(ACCESS_TOKEN_URL)."&";

		    $params = array(
		        'oauth_consumer_key=' . CONSUMER_KEY . URL_SEPARATOR,
		        'oauth_nonce=' . $oauth_nonce . URL_SEPARATOR,
		        'oauth_signature_method=HMAC-SHA1' . URL_SEPARATOR,
		        'oauth_token=' . $oauth_token . URL_SEPARATOR,
		        'oauth_timestamp=' . $oauth_timestamp . URL_SEPARATOR,
		        'oauth_verifier=' . $oauth_verifier . URL_SEPARATOR,
		        'oauth_version=1.0'
		    );

		    $key = CONSUMER_SECRET . URL_SEPARATOR . $oauth_token_secret;
		    $oauth_base_text = 'GET' . URL_SEPARATOR . urlencode(ACCESS_TOKEN_URL) . URL_SEPARATOR . implode('', array_map('urlencode', $params));
		    $oauth_signature = base64_encode(hash_hmac("sha1", $oauth_base_text, $key, true));

		    // получаем токен доступа
		    $params = array(
		        'oauth_nonce=' . $oauth_nonce,
		        'oauth_signature_method=HMAC-SHA1',
		        'oauth_timestamp=' . $oauth_timestamp,
		        'oauth_consumer_key=' . CONSUMER_KEY,
		        'oauth_token=' . urlencode($oauth_token),
		        'oauth_verifier=' . urlencode($oauth_verifier),
		        'oauth_signature=' . urlencode($oauth_signature),
		        'oauth_version=1.0'
		    );
		    $url = ACCESS_TOKEN_URL . '?' . implode('&', $params);

		    $response = file_get_contents($url);
		    parse_str($response, $response);


		    // формируем подпись для следующего запроса
		    $oauth_nonce = md5(uniqid(rand(), true));
		    $oauth_timestamp = time();

		    $oauth_token = $response['oauth_token'];
		    $oauth_token_secret = $response['oauth_token_secret'];
		    $screen_name = $response['screen_name'];

		    $params = array(
		        'oauth_consumer_key=' . CONSUMER_KEY . URL_SEPARATOR,
		        'oauth_nonce=' . $oauth_nonce . URL_SEPARATOR,
		        'oauth_signature_method=HMAC-SHA1' . URL_SEPARATOR,
		        'oauth_timestamp=' . $oauth_timestamp . URL_SEPARATOR,
		        'oauth_token=' . $oauth_token . URL_SEPARATOR,
		        'oauth_version=1.0' . URL_SEPARATOR,
		        'screen_name=' . $screen_name
		    );
		    $oauth_base_text = 'GET' . URL_SEPARATOR . urlencode(ACCOUNT_DATA_URL) . URL_SEPARATOR . implode('', array_map('urlencode', $params));

		    $key = CONSUMER_SECRET . '&' . $oauth_token_secret;
		    $signature = base64_encode(hash_hmac("sha1", $oauth_base_text, $key, true));

			// получаем данные о пользователе
		    $params = array(
		        'oauth_consumer_key=' . CONSUMER_KEY,
		        'oauth_nonce=' . $oauth_nonce,
		        'oauth_signature=' . urlencode($signature),
		        'oauth_signature_method=HMAC-SHA1',
		        'oauth_timestamp=' . $oauth_timestamp,
		        'oauth_token=' . urlencode($oauth_token),
		        'oauth_version=1.0',
		        'screen_name=' . $screen_name
		    );

		    $url = ACCOUNT_DATA_URL . '?' . implode(URL_SEPARATOR, $params);


		    $response = file_get_contents($url);
		    $user_data = json_decode($response, true);
		    // echo $user_data['name'];
		    $arr_data = explode(" ", $user_data['name']);
		    $data['firstname'] = $arr_data[0];
		    $data['lastname'] = $arr_data[1];

		    $this->load->model('account/customer');			 
			 $customer_info = $this->model_account_customer->getCustomerNameFam($data);
	    			 

			 if( isset($customer_info['firstname']) ) { 

				$this->session->data['customer_id'] = $customer_info['customer_id'];

			 	 $this->redirect($this->url->link('account/account'));
				 	// header("Location:http://google.ru");

			  }else{


				$this->model_account_customer->addCustomer($data);

				$customer_id = $this->model_account_customer->getCustomerLastId();
				$this->session->data['customer_id'] = $customer_id['MAX(customer_id)'];

			    $this->load->model('affiliate/affiliate');
				$this->model_affiliate_affiliate->addAffiliate($data, $this->session->data['customer_id'], $_COOKIE['tracking'] );
				if($_COOKIE['tracking']){
					$this->model_affiliate_affiliate->pushCountRegByCode($_COOKIE['tracking']);
			    }
				

				 $this->redirect($this->url->link('account/account'));

			  }
			  
		}
  	}

}
?>