<?php
	require_once('funkcje.php');
	require_once('header.php');
	
	$isAdded = false;
	if (isset($_POST['submitted']))
	{
		$userName = $_POST['userName'];
		$userSurname = $_POST['userSurname'];
		$userStreet = $_POST['userStreet'];
		$userHome = $_POST['userHome'];
		$userZipCode = $_POST['userZipCode'];
		$userCity = $_POST['userCity'];
		$userState = $_POST['userState'];
		$typeOfShipment = $_POST['typeOfShipment'];
		$numberOfPoints = $_POST['numberOfPoints'];
		
		if (isFilled($_POST) && isset($_SESSION['basket']))
		{
			if (isset($numberOfPoints))
			{
				$availablePoints = numberPoints();
				if ($numberOfPoints > $availablePoints && $availablePoints <= 15 && $availablePoints >= 0)
					$numberOfPoints = $availablePoints;
				elseif ($numberOfPoints > 15)
					$numberOfPoints = 15;
				elseif ($numberOfPoints < 0)
					$numberOfPoints = 0;
					
				
			}
			else
				$numberOfPoints = 0;
			
			$isAdded = proceedOrder($_SESSION['id'], $userName, $userSurname, $userStreet, $userHome, $userZipCode, $userCity, $userState, $typeOfShipment, $_SESSION['basket'], $numberOfPoints);
			
			if ($isAdded)
			{
				echo '<div class="page-title">
						<h1>Zamówienie dodane pomyślnie</h1>   
					  </div>';
				$totalPriceWithPoints = getTotalPrice($_SESSION['basket'], $typeOfShipment) - $numberOfPoints;
				echo 'Całkowita wartość zamówienia: '.$totalPriceWithPoints.' zł';
				unset($_SESSION['basket']);
			}
				
		}
	}
	if (!$isAdded)
	{
		$sumOfOrder = 0;
		$books;
		$quntities;
		if (isset($_SESSION['basket']))
			foreach ($_SESSION['basket'] as $ISBN => $quantity)
			{
				$books[$ISBN] = p_opis_ksiazki($ISBN);
				$quanities[$ISBN] = $quantity;
				$sumOfOrder += $quantity * $books[$ISBN]['price'];
			}

		if (!isset($_POST['submitted']))
		{
			$userShipmentData = getUserShipmentData($_SESSION['id']);
			
			if ($userShipmentData)
			{
				$userName = $userShipmentData['imie'];;
				$userSurname = $userShipmentData['nazwisko'];
				$userStreet = $userShipmentData['ulica'];
				$userHome = $userShipmentData['nr_domu'];
				$userZipCode = $userShipmentData['kodpocztowy'];
				$userCity = $userShipmentData['miasto'];
				$userState = $userShipmentData['wojewodztwo'];
				
			}
			
		}
?>	
	
<div class="page-title">
	<h1>Zamówienie</h1>   
</div>
<form  method="post" action="proceed.php" class="zaloguj">
	<div class="sing">
		<div class="sing-left">
			<h2>Wprowadź dane do wysyłki</h2>
			
				<div class="input-line">
					<label for="userName">Imię: </label>
					<input type="text" name="userName" value="<?php if (isset($userName)) echo $userName; ?>">
				</div>
				<div class="input-line">
					<label for="UserSurname">Nazwisko: </label>
					<input type="text" name="userSurname" value="<?php if (isset($userSurname)) echo $userSurname; ?>">
				</div> 
				<div class="input-line">
					<label for="userStreet">Ulica: </label>
					<input type="text" name="userStreet" value="<?php if (isset($userStreet)) echo $userStreet; ?>">
				</div> 
				<div class="input-line">
					<label for="userHome">Numer mieszkania: </label>
					<input type="text" name="userHome" value="<?php if (isset($userHome)) echo $userHome; ?>">
				</div> 
				<div class="input-line">
					<label for="userZipCode">Kod pocztowy: </label>
					<input type="text" name="userZipCode" value="<?php if (isset($userZipCode)) echo $userZipCode; ?>">
				</div> 
				<div class="input-line">
					<label for="userCity">Miasto: </label>
					<input type="text" name="userCity" value="<?php if (isset($userCity)) echo $userCity; ?>">
				</div> 
				<div class="input-line">
					<label for="userState">Województwo: </label>
					<input type="text" name="userState" value="<?php if (isset($userState)) echo $userState; ?>">
				</div> 
				<input type="hidden" name="submitted" value="true">
		</div>  
		<div class="sing-right">
			<h2>Rodzaj wysyłki</h2>
<?php
			listTypeOfShipment();
?>
			<h2>Punkty do wykorzystania</h2>
			Masz <b><?php echo numberPoints(); ?></b> punktów.<br> Możesz je wykorzystać do obniżenia ceny zamówienia. 1 punkt = 1 zł.
			Możesz wykorzystać maksymalnie 15 punktów.<br>
			Wpisz liczbę punktów, którą chcesz użyć: <input type="text" name="numberOfPoints" value="0<?php if (isset($numberOfPoints)) echo $numberOfPoints; ?>">
			<br>
			<br>Cena do zapłaty za książki:
<?php
			echo $sumOfOrder;
?>
			zł
			<div class="buttons">
				<button type="submit" class="button" value="ZŁÓŻ ZAMÓWIENIE">ZŁÓŻ ZAMÓWIENIE</button>
			</div>
		</div>
	</div>
</form>
<div class="container">
	<h2>Produkty</h2>
<?php
	if (isset($books))
		foreach ($books as $key => $book)
		{
?>
			<div class="book-details">
				<div class="book-details-left">
					<div class="book-details-left-cover">
						<?php echo "<img src=\"images/coverThumb/".$book['img_name']."\" width=\"145\" height=\"218\">" ?>		
					</div>
					<div class="book-details-left-info">
						<h2><?php echo $book['title']; ?></h2>
						Autor: <b><?php echo $book['author']; ?></b><br>
						Cena: <?php echo $book['price']; ?> zł<br>
						Ilość: <?php echo $quanities[$key]; ?> szt.<br>
						Cena: <?php echo $quanities[$key] * $book['price']; ?> zł
					</div>
				</div>
			</div>
<?php
		}
?>
</div>
<?php
	}
	require('footer.php');
?>