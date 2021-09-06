<?php

function isFilled($form)
{
	foreach ($form as $key => $value)
		if ((!isset($key) || ($value == '')))
		{
			return false;
		}
			
		
	return true;
}

function checkEmail($email)
{
	if (ereg('^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$', $email))
		return true;
	else
		return false;
}

function checkRecommendedEmail($email)
{
	if (!checkEmail($email))
	{
		$db = connectDB();
		$query = $db->query("SELECT * FROM users WHERE mail='".$email."'");
		
		if ($query->num_rows > 0)
			return true;
	}
	return false;
}

function register($userEmail, $userPassword, $recommendationEmail)
{
	$db = connectDB();
	
	$query = $db->query("SELECT * FROM users WHERE mail='".$userEmail."'");
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	if ($query->num_rows > 0)
	{
		echo 'Użytkownik z takim adresem e-mail już istnieje.<br>';
		return false;
	}
	
	$query = $db->query("INSERT INTO users values ('', '".$userEmail."', '".sha1($userPassword)."', 0)");
	
	if (!$query)
	{
		echo 'Rejestracja nie powiodła się z powodu problemów z bazą danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	
	$pointsPerRecommendation = 1;
	$query = $db->query("UPDATE users SET punkty=punkty+".$pointsPerRecommendation." WHERE mail='".$recommendationEmail."'");
	
	return true;
}

function addBook($ISBN, $title, $author, $publishing, $page, $print, $category, $price, $description, $cover_url, $data_d)
{
	$db = connectDB();
	$query = $db->query("SELECT * FROM ksiazki WHERE ISBN='".$ISBN."'");
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	if ($query->num_rows > 0)
	{
		echo 'Istnieje już ksiązka o takim samym ISBN.<br>';
		return false;
	}
	
	$query = $db->query("INSERT INTO ksiazki values ('".$ISBN."', '".$title."', '".$author."', '".$publishing."', '".$page."', '".$print."','".$category."', '".$price."', '".$description."', '".$cover_url."', '".$data_d."')");
	
	if (!$query)
	{
		echo 'Książka nie została dodana z powodu problemów z bazą danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	
	return true;
}

function isISBNValid($ISBN)
{
	$db = connectDB();

	$query = $db->query("SELECT * FROM ksiazki WHERE ISBN='".$ISBN."'");
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	if ($query->num_rows > 0)
		return true;
}

function proceedOrder($userEmail, $name, $surname, $street, $home, $zipCode, $city, $userState, $typeOfShipment, $products, $numberOfPoints)
{
	$db = connectDB();

	$query = $db->query("SELECT * FROM wysylka WHERE id='".$typeOfShipment."'");
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	if ($query->num_rows < 1)
	{
		echo 'Wybrany rodzaj przesyłki nie istnieje.<br>';
		return false;
	}
	$query = $db->query("SELECT * FROM users WHERE mail='".$userEmail."'");
	$user = $query->fetch_assoc();

	$totalPrice = getTotalPrice($products, $typeOfShipment) - $numberOfPoints;

	$query = $db->query("INSERT INTO zmaowienie values (NULL, '".$user['user_id']."', '".$name."', '".$surname."', '".$street."', '".$home."','".$zipCode."', '".$city."', '".$userState."' ,'".$typeOfShipment."', '".$totalPrice."', now(), 'w realizacji')");
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	
	$orderId = $db->insert_id;
	foreach ($products as $ISBN => $quantity)
	{
		$query = $db->query("INSERT INTO zamowienie_produkty values ('', '".$orderId."', '".$ISBN."', '".$quantity."')");
		if (!$query)
		{
			echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
			return false;
		}
	}
	
	$query = $db->query("UPDATE users SET punkty=punkty-".$numberOfPoints." WHERE mail='".$userEmail."'");
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	
	return true;
}

function getTotalPrice($products, $typeOfShipment)
{
	$totalPrice = 0;
	foreach ($products as $ISBN => $quantity)
	{
		$book = p_opis_ksiazki($ISBN);
		$totalPrice += $book['price'] * $quantity;
	}

	if ($priceOfShimpent = getShipmentData($typeOfShipment)['cena'])
		$totalPrice += $priceOfShimpent;

	return $totalPrice;
}

function acceptOrder($id)
{
	$db = connectDB();

	$query = $db->query("UPDATE zmaowienie SET status='wyslano' WHERE id='".$id."'");
	if (!$query || $db->affected_rows <= 0)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	
	return true;
}

?>