<?php
	function listCategories()
	{
		$db = connectDB();
		$query = $db->query("SELECT id, nazwa from kategorie");
		
		if (!$query)
			return false;		
		
		$numRows = $query->num_rows;
		if ($numRows == 0)
			return false;
			
		echo '<ul>';
		for ($i = 0; $i < $numRows; ++$i)
		{
			$row = $query->fetch_assoc();
			$url = "kategorie.php?id=".$row['id'];
			$title = $row['nazwa'];
			echo '<li>';
			echo '<a href="'.$url.'">'.$title.'</a>';
			echo '</li>';
		}
		echo '</ul>';
		
		return true;
	}
	
	function listCategoriesToSelect()
	{
		$db = connectDB();
		$query = $db->query("SELECT id, nazwa from kategorie ORDER BY nazwa ASC");
		
		if (!$query)
			return false;		
		
		$numRows = $query->num_rows;
		if ($numRows == 0)
			return false;
			
		echo '<select class="selectphp" name="category">';
		for ($i = 0; $i < $numRows; ++$i)
		{
			$row = $query->fetch_assoc();
			echo '<option value="'.$row['id'].'">';
			echo $row['nazwa'];
			echo '</option>';
		}
		echo '</select>';
		
		return true;
	}
	
	function createSelectCategories()
	{
		$db = connectDB();
		$query = $db->query("SELECT id, nazwa from kategorie ORDER BY nazwa ASC");
		
		if (!$query)
			return false;		
		
		$numRows = $query->num_rows;
			
		echo '<select name="category">';
		for ($i = 0; $i < $numRows; ++$i)
		{
			$row = $query->fetch_assoc();
			echo '<optgroup label="'.$row['nazwa'].'">';
			$query2 = $db->query("SELECT id, nazwapod from podkategorie WHERE idkat='".$row['id']."' ORDER BY nazwapod ASC");
		
			if (!$query2)
				return false;		
			
			$numRows2 = $query2->num_rows;
			for ($j = 0; $j < $numRows2; ++$j)
			{
				$row2 = $query2->fetch_assoc();
				echo '<option value="'.$row2['id'].'">';
				echo $row2['nazwapod'];
				echo '</option>';
			}
			echo '</optgroup>';
		}
		echo '</select>';
		
		return true;
	}

function p_opis_ksiazki($isbn) {
  if ((!$isbn) || ($isbn=='')) {
     return false;
  }

   $db = connectDB();
   $query = @$db->query("select * from ksiazki where isbn='".$isbn."'");
   if (!$query) {
     return false;
   }
   $query = @$query->fetch_assoc();
   return $query;
}

function p_kategorie($id) {
	 if ((!$id) || ($id=='')) {
     return false;
  }

   $db = connectDB();
   $query = @$db->query("select nazwa from kategorie where id='".$id."'");
   if (!$query) {
     return false;
   }
   $query = @$query->fetch_assoc();
   return $query;

}

function p_podkategorie($idkat) {
	 if ((!$idkat) || ($idkat=='')) {
     return false;
  }

   $db = connectDB();
   $query = @$db->query("select nazwapod from podkategorie where id='".$idkat."'");
   if (!$query) {
     return false;
   }
   $query = @$query->fetch_assoc();
   return $query;

}

function listSubCategories($kategoria, $type = 0)
	{
		$db = connectDB();
		if ($type)
		{
			$query = $db->query("SELECT idkat from podkategorie where id='".$kategoria."'");
			$row = $query->fetch_assoc();
			$kategoria = $row['idkat'];
		}
		$query = $db->query("SELECT id,idkat, nazwapod from podkategorie where idkat='".$kategoria."'");
		
		if (!$query)
			return false;		
		
		$numRows = $query->num_rows;
		if ($numRows == 0)
			return false;
			
		echo '<ul>';
		for ($i = 0; $i < $numRows; ++$i)
		{
			$row = $query->fetch_assoc();
			$url = "podkategorie.php?id=".$row['id'];
			$title = $row['nazwapod'];
			echo '<li>';
			echo '<a href="'.$url.'">'.$title.'</a>';
			echo '</li>';
		}
		echo '</ul>';
		
		return true;
	}


function p_ksiazki_k($id) {
	if ((!$id) || ($id=='')) {
     return false;
  }

   $db = connectDB();
   $query = $db->query("select * from ksiazki left join podkategorie on podkategorie.id = ksiazki.category_id where podkategorie.idkat='".$id."'");
   if (!$query) {
     return false;
   }
  for ($licznik=0; $wbook = $query->fetch_assoc(); $licznik++) {
    		echo '<div class="books">
					<div class="book">
					<a href="f_wyswietl_ksiazke.php?isbn='.$wbook['ISBN'].'">
					<div class="cover">
						<img src="images/cover/'.$wbook['img_name'].'" width="145" height="218">
					</div>
					<div class="book-info">
						<div class="hid"><a class="booka" href="f_wyswietl_ksiazke.php?isbn='.$wbook['ISBN'].'">'.$wbook['title'].'</a></div>
						<div class="author"> '.$wbook['author'].'</div>
					</div>
					<div class="price">
						Cena: '.$wbook['price'].'.00 zł
					</div>
					</a>
				</div>';
   }

}

function p_ksiazki_pk($id) {
	if ((!$id) || ($id=='')) {
     return false;
  }

   $db = connectDB();
   $query = $db->query("select * from ksiazki where category_id='".$id."'");
   if (!$query) {
     return false;
   }
  for ($licznik=0; $wpbook = $query->fetch_assoc(); $licznik++) {
    		echo '<div class="books">
					<div class="book">
					<a href="f_wyswietl_ksiazke.php?isbn='.$wpbook['ISBN'].'">
					<div class="cover">
						<img src="images/cover/'.$wpbook['img_name'].'" width="145" height="218">
					</div>
					<div class="book-info">
						<div class="hid"><a href="f_wyswietl_ksiazke.php?isbn='.$wpbook['ISBN'].'">'.$wpbook['title'].'</a></div>
						<div class="author">'.$wpbook['author'].'</div>
					</div>
					<div class="price">
						Cena: '.$wpbook['price'].'.00 zł
					</div>
					</a>
				</div>';
   }

}

function nowosci () {
	$db = connectDB();
    $query = $db->query("select * from ksiazki order by data DESC");
    if (!$query) {
      return false;
   }

   for ($licznikk=0; ( $nowosci = $query->fetch_assoc() ) && $licznikk <10; $licznikk++) {
   echo '
   <div class="books">
		<div class="book">
		<a href="f_wyswietl_ksiazke.php?isbn='.$nowosci['ISBN'].'">
			<div class="cover">
				<img src="images/cover/'.$nowosci['img_name'].'" width="145" height="218">
			</div>
			<div class="book-info">
				<div class="hid"><a href="f_wyswietl_ksiazke.php?isbn='.$nowosci['ISBN'].'">'.$nowosci['title'].'</a></div>
				<div class="author">'.$nowosci['author'].'</div>
			</div>
			<div class="price">
				Cena: '.$nowosci['price'].'.00 zł
			</div>
			</a>
		</div> ';
}
}

function szukaj ($szukaj) {
	$szukaj=strtolower($szukaj);

	$db = connectDB();
	$query = $db->query("SELECT * from ksiazki where LOWER(author) like '%".$szukaj."%' OR LOWER(ISBN) like '%".$szukaj."%' OR LOWER(title) like '%".$szukaj."%' ");

	if (!$query) {
      return false;
   }

   for ($licznikkk=0; $wynik = $query->fetch_assoc(); $licznikkk++) {
   echo '
   <div class="books">
		<div class="book">
		<a class="booka" href="f_wyswietl_ksiazke.php?isbn='.$wynik['ISBN'].'">
			<div class="cover">
				<img src="images/cover/'.$wynik['img_name'].'" width="145" height="218">
			</div>
			<div class="book-info">
				<div class="hid" ><a href="f_wyswietl_ksiazke.php?isbn='.$wynik['ISBN'].'">'.$wynik['title'].'</a></div>
				<div class="author">'.$wynik['author'].'</div>
			</div>
			<div class="price">
				Cena: '.$wynik['price'].'.00 zł
			</div>
			</a>
		</div> ';
}

}

function daneu($dane_klienta){
	$db = connectDB();

	$query = $db->query("SELECT user_id FROM dklienta, users WHERE users.mail='".$dane_klienta."'");
	$query = $query->fetch_assoc();
	$user_id=$query['user_id'];

	$query = $db->query("SELECT imie, nazwisko, ulica, nr_domu, miasto, wojewodztwo, kodpocztowy FROM dklienta WHERE f_user='".$user_id."'");
	$query = $query->fetch_assoc();
	if (!$query) {
		echo'
	<div class="m-zamowienia">
                        <h2>MOJE DANE</h2>
                           <ul>
                           		<li>Imię:</li>
                           		<li>Nazwisko:</li>
                           		<li>Ulica: </li>
                           		<li>Nr_domu: </li>
								<li>Miasto: </li>
                           		<li>Województwo: </li>
                           		<li>Kod pocztowy:</li>

                           </ul>
                    </div>';
      return false;
   }
   echo'
	<div class="m-zamowienia">
                        <h2>MOJE DANE</h2>
                           <ul>
                           		<li>Imię:'.$query['imie'].' </li>
                           		<li>Nazwisko:'.$query['nazwisko'].'</li>
                           		<li>Ulica: '.$query['ulica'].'</li>
								<li>Nr_domu: '.$query['nr_domu'].'</li>
                           		<li>Miasto: '.$query['miasto'].'</li>
                           		<li>Województwo: '.$query['wojewodztwo'].'</li>
                           		<li>Kod pocztowy:'.$query['kodpocztowy'].'</li>

                           </ul>
                    </div>';
}

function listTypeOfShipment()
{
	$db = connectDB();

	$query = $db->query("SELECT * FROM wysylka ORDER BY rodzaj ASC");

	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	else
	{
		$numRows = $query->num_rows;
		if ($numRows == 0)
		{
			echo 'Brak dostępnych rodzajów wysyłki<br>';
			return false;
		}

		echo '<select name="typeOfShipment">';
		for ($i = 0; $i < $numRows; ++$i)
		{
			$row = $query->fetch_assoc();
			echo '<option value="'.$row['id'].'">';
			echo $row['rodzaj']." (".$row['cena'].' zł)';
			echo '</option>';
		}
		echo '</select>';
	}
}

function getUserShipmentData($id)
{
	$db = connectDB();
	$query = $db->query("SELECT dklienta.* from users, dklienta WHERE users.mail='".$id."' AND users.user_id=dklienta.f_user");

	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	else
	{
		$numRows = $query->num_rows;
		if ($numRows == 0)
			return false;

		return $query->fetch_assoc();
	}
}

function getShipmentData($typeOfShipment)
{
	$db = connectDB();
	$query = $db->query("SELECT * from wysylka WHERE id='".$typeOfShipment."'");
	
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	else
	{
		$numRows = $query->num_rows;
		if ($numRows == 0)
			return false;

		return $query->fetch_assoc();
	}
}

function showOrder(){
	$db = connectDB();
	
	$query = $db->query("SELECT user_id FROM  users WHERE mail='".$_SESSION['id']."' ");
	$query = $query->fetch_assoc();
	$user_id=$query['user_id'];
	
	
	$query = $db->query("SELECT *, zmaowienie.id AS orderId from zmaowienie, wysylka WHERE user_id='".$user_id."' AND wysylka.id=zmaowienie.typeOfShipment  ORDER BY date desc");
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
	
		echo '<tr>';
		echo '<td> Data zamówienia</td>';
		echo '<td> Wysyłka</td>';
		echo '<td> Status</td>';
		echo '<td> Cena </td>';
		echo '</tr>';
	
	$numRows = $query->num_rows;
	for ($i = 0; $i < $numRows; ++$i)
	{
		$row = $query->fetch_assoc();
		echo '<tr>';
		echo '<td>'.$row['date'].'</td>';
		$books = $db->query("SELECT * from zamowienie_produkty WHERE order_id='".$row['orderId']."'");
		echo '<td>'.$row['rodzaj'].'</td>';
		echo '<td>'.$row['status'].'</td>';
		echo '<td>'.$row['totalPrice'].'  zł </td>';

		echo '</tr>';
	}
	
	return true;
}

function numberPoints() {
	$db = connectDB();
	$query = $db->query("SELECT punkty from users WHERE mail='".$_SESSION['id']."'");
	$row=$query->fetch_assoc();
	return $row['punkty'];
}

function showCustomersOrders() {
	$db = connectDB();
	$query = $db->query("SELECT *, zmaowienie.id AS orderId from zmaowienie, wysylka WHERE status='w realizacji' AND wysylka.id=zmaowienie.typeOfShipment ORDER BY date desc");
	if (!$query)
	{
		echo 'Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.<br>';
		return false;
	}
		echo '<tr>';
		echo '<td> Imię i Nazwisko </td>';
		echo '<td> Ulica i nr. domu</td>';
		echo '<td> Miasto | Kod pocztowy  </td>';
		echo '<td> Województwo</td>';
		echo '<td> Książka : ilość </td>';
		echo '<td> Rodzaj wysyłki </td>';
		echo '<td> Akceptuj </td>';
		echo '</tr>';
		
	$numRows = $query->num_rows;
	for ($i = 0; $i < $numRows; ++$i)
	{
		$row = $query->fetch_assoc();
		echo '<tr>';
		echo '<td>'.$row['name'].' '.$row['surname'].'</td>';
		echo '<td>'.$row['street'].' '.$row['home'].'</td>';
		echo '<td>'.$row['city'].' '.$row['zip_code'].' </td>';
		echo '<td>'.$row['state'].'</td>';
		$books = $db->query("SELECT * from zamowienie_produkty WHERE order_id='".$row['orderId']."'");
		echo '<td><ul>';
		$numOfBooks = $books->num_rows;
		for ($j = 0; $j < $numOfBooks; ++$j)
		{
			$book = $books->fetch_assoc();
			echo '<li>'.$book['ISBN'].': '.$book['quantity'].'</li>';
		}
		echo '</ul></td>';
		echo '<td>'.$row['rodzaj'].'</td>';
		echo '<td><form action="akceptuj_zamowienie.php" method="post">
					<input type="hidden" name="submitted">
					<input type="hidden" name="id" value="'.$row['orderId'].'">
					<input type="submit" value="Akceptuj">
				</form></td>';
		echo '</tr>';
	}
	
	return true;
}
?>