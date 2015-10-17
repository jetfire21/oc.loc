<?php 

class ControllerAccountFb extends Controller {
	private $error = array();
	      
  	public function index() {

		define("URL_AUTH", "http://www.facebook.com/dialog/oauth");
		define("CLIENT_ID", "1509984645979841");
		define("SECRET", "e7151766c7a52f61ad7f58d4b5e65739");
		// define("REDIRECT", $this->config->get('config_url')."account/register/reg_facebook" );
		define("REDIRECT", $this->config->get('config_url')."account-fb" );
		 // define("REDIRECT", $this->url->link('account/register/reg_facebook','', 'SSL') );

		define("TOKEN", "https://graph.facebook.com/oauth/access_token");
		define("GET_DATA", "https://graph.facebook.com/v2.5/me?fields=email,name&");

		$path = URL_AUTH."?".urldecode("client_id=".CLIENT_ID."&redirect_uri=".REDIRECT."&response_type=code&scope=email");

		if(!$_GET['code']){
			header("Location: " . $path);
			echo $path;
		}else{

			$code = $_GET['code'];
			$query = "client_id=". CLIENT_ID ."&client_secret=".SECRET."&redirect_uri=".REDIRECT."&code=".$code;

			// инициализация сеанса
			$ch = curl_init();

			// установка URL и других необходимых параметров
			curl_setopt($ch, CURLOPT_URL, TOKEN ."?". urldecode($query));
			curl_setopt($ch, CURLOPT_HEADER, 0);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 

			// загрузка страницы и выдача её браузеру
			$result = curl_exec($ch);
			if(!$result){
				exit(curl_error($ch));
			}

			// завершение сеанса и освобождение ресурсов
			curl_close($ch);

			// var_dump($result);
			$res = json_decode($result);  // обьект
			if($res->error){
				exit($res->error->message);
			}
			else{
				parse_str($result,$token);
				if($token['access_token']){

					$query = "access_token=".$token['access_token'];

					//echo $token['access_token'];
					$ch2 = curl_init();

					// установка URL и других необходимых параметров
					curl_setopt($ch2, CURLOPT_URL, GET_DATA ."". $query);
					curl_setopt($ch2, CURLOPT_HEADER, 0);
					curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true); 

					// загрузка страницы и выдача её браузеру
					$result2 = curl_exec($ch2);
					if(!$result2){
						exit(curl_error($ch2));
					}

					// завершение сеанса и освобождение ресурсов
					curl_close($ch2);

					//var_dump($result2);

					$res2 = json_decode($result2);  // обьект
					if($res2->error){
						exit($res2->error->message);
					}
					 //print_r($res2);
					// echo $res2->name;
					// echo $res2->email;
					$arr = explode(" ", $res2->name);

					$data['firstname'] = $arr[0];
				    $data['lastname'] = $arr[1];
				    $data['email'] = $res2->email;


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
				else exit("no get access_token");
			}


		}

  	}

}
?>