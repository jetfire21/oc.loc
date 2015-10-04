<?php

$app_id = "5084524";
$app_key = "xXB9LPhvly2TwY5VH5Ko";
$redirect_uri = "http://akahooliganka.com/vk.php";
$access_token = "https://oauth.vk.com/access_token";
$url_auth = "http://oauth.vk.com/authorize";
$query_api = "https://api.vk.com/method/";


if(!$_GET['code']){

	$query = "client_id=". $app_id ."&scope=offline&display=page&redirect_uri=".$redirect_uri."&response_type=code";
	header("Location: " . $url_auth ."?". $query);

}else{
	// echo $_GET['code'];
	$code = $_GET['code'];
	$query = "client_id=". $app_id ."&client_secret=".$app_key."&redirect_uri=".$redirect_uri."&code=".$code;

	// инициализация сеанса
	$ch = curl_init();

	// установка URL и других необходимых параметров
	curl_setopt($ch, CURLOPT_URL, $access_token ."?". $query);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 

	// загрузка страницы и выдача её браузеру
	$result = curl_exec($ch);

	// завершение сеанса и освобождение ресурсов
	curl_close($ch);

	// var_dump($result);
	$res = json_decode($result);  // обьект

	// если нет ошибки
	if(!$res->error_description){

		$query = "users.get?user_ids=".$res->user_id."&fields=first_name,last_namem&v=5.37&access_token=".$res->access_token;

		// инициализация сеанса
		$ch2 = curl_init();

		// установка URL и других необходимых параметров
		curl_setopt($ch2, CURLOPT_URL, $query_api. $query);
		curl_setopt($ch2, CURLOPT_HEADER, 0);
		curl_setopt($ch2, CURLOPT_SSL_VERIFYHOST, false);
		curl_setopt($ch2, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true); 

		// загрузка страницы и выдача её браузеру
		$result = curl_exec($ch2);

		// завершение сеанса и освобождение ресурсов
		curl_close($ch2);
		$result = json_decode($result);
		//print_r($result->response);

		//если нет ошибок
		 if(!$result->error->error_msg){
			//print_r($result->response);
			echo $result->response[0]->first_name;
			echo $result->response[0]->last_name;
		}else{
			exit($result->error->error_msg);
		}
	}
	else{
		exit($res->error_description);
	}

}



?>