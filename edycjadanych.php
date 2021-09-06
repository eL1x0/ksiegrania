<?php
	require_once('funkcje.php');
	require_once('header.php');
    $dane_klienta=$_SESSION['id'];
    $db = connectDB();

		$query = $db->query("SELECT user_id FROM  users WHERE mail='".$dane_klienta."'");
		$query = $query->fetch_assoc();
		$user_id=$query['user_id'];
	
		
		$query = $db->query("SELECT id,imie, nazwisko, ulica, nr_domu, miasto, wojewodztwo, kodpocztowy FROM dklienta WHERE f_user='".$user_id."'");
		$query = $query->fetch_assoc();
		
		$id=$query['id'];

		$query = $db->query("SELECT id,imie, nazwisko, ulica, nr_domu, miasto, wojewodztwo, kodpocztowy FROM dklienta WHERE f_user='".$user_id."'");
		$ile = $query->num_rows;
	
	
	
    
	if (!isset($_POST['submitted'])){
	

		$query = $db->query("SELECT imie, nazwisko, ulica, nr_domu, miasto, wojewodztwo, kodpocztowy FROM dklienta WHERE f_user='".$user_id."'");
		$query = $query->fetch_assoc();	
	}


	else
	{
		if($ile<=0){
		
				$imie = $_POST['imie'];
				$nazwisko = $_POST['nazwisko'];
				$ulica = $_POST['ulica'];		
				$nr_domu = $_POST['nr_domu'];
				$miasto = $_POST['miasto'];
				$wojewodztwo = $_POST['wojewodztwo'];
				$kodpocztowy = $_POST['kodpocztowy'];


				$db = connectDB();
				$queryi = $db->query("INSERT INTO dklienta(imie, nazwisko, ulica, nr_domu, miasto, wojewodztwo, kodpocztowy, f_user) VALUES ('".$imie."' , '".$nazwisko."', '".$ulica."', '".$nr_domu."', '".$miasto."', '".$wojewodztwo."', '".$kodpocztowy."', '".$user_id."' )"); 


			if (!$queryi)
			{
				echo 'Nie udało się dodać danych. Proszę spróbować ponownie później.<br>';
				return false;
			}
			if ($queryi)
				echo 'Dane zostały dodane.';
		}

		else{

		$imie = $_POST['imie'];
		$nazwisko = $_POST['nazwisko'];
		$ulica = $_POST['ulica'];		
		$nr_domu = $_POST['nr_domu'];
		$miasto = $_POST['miasto'];
		$wojewodztwo = $_POST['wojewodztwo'];
		$kodpocztowy = $_POST['kodpocztowy'];

		$db = connectDB();
		$queryy = $db->query("UPDATE dklienta SET id= '".$id."', imie = '".$imie."', nazwisko = '".$nazwisko."',ulica = '".$ulica."', nr_domu ='".$nr_domu."', miasto ='".$miasto."', wojewodztwo ='".$wojewodztwo."', kodpocztowy='".$kodpocztowy."',f_user='".$user_id."'  where f_user='".$user_id."'   ");
	
		if (!$queryy)
		{
			echo 'Nie udało się uaktualnić danych. Proszę spróbować ponownie później.<br>';
			return false;
		}
		if ($queryy)
				echo 'Dane zostały uaktualnione.';

	}
}

$query = $db->query("SELECT id,imie, nazwisko, ulica, nr_domu,  miasto, wojewodztwo, kodpocztowy FROM dklienta WHERE f_user='".$user_id."'");
$query = $query->fetch_assoc();

?>



<div class="panel-klienta">
            <div class="l-panel">
                <ul>
                    <li><a href="dane.php">Dane</a></li>
                    <li><a href="konto.php">Moje zamówienia  </a></li>
                    <li><a href="basket.php">Koszyk</a></li>
                    <li><a href="">Wyloguj </a></li>
                </ul>
            </div>
            <div class="r-panel">
               
                    <div class="m-zamowienia">
                        <h2>EDYTUJ DANE</h2>
                            <form  method="post" action="edycjadanych.php" class="zaloguj" ENCTYPE="multipart/form-data">
								
								<div class="input-line">
									<label for="Imie">Imię: </label>
									<input type="text" size="10" name="imie" value="<?php echo $query['imie'];?>"> 
								</div>
								<div class="input-line">
									<label for="nazwisko">Nazwisko: </label>
									<input type="text" size="60" name="nazwisko" value="<?php echo $query['nazwisko']; ?>"> 
								</div>
								<div class="input-line">
									<label for="adres">Ulica: </label>
									<input type="text" size="40" name="ulica" value="<?php echo $query['ulica']; ?>"> 
								</div>
								<div class="input-line">
									<label for="adres">Nr_domu: </label>
									<input type="text" size="40" name="nr_domu" value="<?php echo $query['nr_domu']; ?>"> 
								</div>
								<div class="input-line">
									<label for="miasto">Miasto: </label>
									<input type="text" size="40" name="miasto" value="<?php echo $query['miasto']; ?>"> 
								</div>
								<div class="input-line">
									<label for="wojewodztwo">Województwo: </label>
									<input type="text" size="40" name="wojewodztwo" value="<?php echo $query['wojewodztwo']; ?>"> 
								</div>
								<div class="input-line">
									<label for="kodpocztowy">Kod pocztowy: </label>
									<input type="text" size="40" name="kodpocztowy" value="<?php echo $query['kodpocztowy']; ?>"> 
								</div>
								<div class="buttons">
									<button type="submit" class="button" value="zaloguj" name="submited">Edytuj</button>
								</div>
								<input type="hidden" name="submitted">
							</form>
                    </div>
                       
                           
             </div>
        
                            
            </div>
   <?php
	require('footer.php');
?>  