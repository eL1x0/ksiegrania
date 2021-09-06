<?php
	require_once('funkcje.php');
	require_once('header.php');
	
	//if (isset($_SESSION['id']))
		//header('Location: index.php');
	
	if (isset($_POST['submitted']))
	{
		$userEmail = $_POST['userEmail'];
		$userPassword = $_POST['userPassword'];
		$repeatPassword = $_POST['repeatPassword'];
		$recommendedEmail;
		if (empty($_POST['recommendedEmail']))
		{
			unset($_POST['recommendedEmail']);
			$recommendedEmail = false;
		}
		else
			$recommendedEmail = $_POST['recommendedEmail'];
		
		$error = false;
		if (!isFilled($_POST))
		{
			echo 'Nie wszystkie pola formularza zostały wypełnione. Spróbuj ponownie.<br>';
			$error = true;
		}
		if (!checkEmail($userEmail))
		{
			echo 'Nieprawidłowy adres e-mail.<br>';
			$error = true;
		}
		if ($userPassword != $repeatPassword)
		{
			echo 'Podane hasła nie pasuja do siebie.<br>';
			$error = true;
		}
		if (strlen($userEmail) > 50)
		{
			echo 'Twój adres e-mail jest zbyt długi.<br>';
			$error = true;
		}
		if ((strlen($userPassword) < 7 || strlen($userPassword) > 40))
		{
			echo 'Hasło musi mieć co najmniej 7, a maksymalnie 40 znaków.<br>';
			$error = true;
		}
		if ($recommendedEmail && checkRecommendedEmail($recommendedEmail))
		{
			echo 'Nieprawidłowy adres e-mail polecającego.<br>';
			$error = true;
		}
		
		if (!$error)
		{
			if (register($userEmail, $userPassword, $recommendedEmail))
			{
?>
<div class="page-title">
	<h1>Rejestracja powiodła się</h1>   
</div>

<?php
				exit();
			}
		}
	}
?>
<?php
?>
<div class="page-title">
	<h1>Zarejestruj się</h1>   
</div>
<div class="sing">
	<div class="sing-left">
		<form  method="post" action="rejestracja.php" class="zaloguj">
			<div class="input-line">
				<label for="userEmail">E-mail: </label>
				<input type="text" name="userEmail" value="<?php echo $userEmail; ?>">
			</div>
			 <div class="input-line">
				<label for="userPassword">Hasło: </label>
				<input type="password" name="userPassword"> 
			</div> 
			<div class="input-line">
				<label for="repeatPassword">Powtórz hasło: </label>
				<input type="password" name="repeatPassword"> 
			</div>
			<div class="input-line">
				<label for="recommendedEmail">E-mail polecającego: </label>
				<input type="text" name="recommendedEmail" value="<?php echo $recommendedEmail; ?>"> 
			</div>
			<div class="buttons">
				<button type="submit" class="button" value="zaloguj">ZAREJESTRUJ SIĘ</button>
			</div>
			<input type="hidden" name="submitted" value="1">
		</form>
	</div>  
	<div class="sing-right">
		<h2>
			Masz już konto?
		</h2>
			<a href="zaloguj.php" class="buttonr" title="Zarejestruj się">ZALOGUJ SIĘ</a>
	</div>
</div>
<?php
	require('footer.php');
?>