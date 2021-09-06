<?php
	require_once('funkcje.php');
	require_once('header.php');
	
	if (isset($_SESSION['id']))
	 header('Location: index.php');
	
	if (isset($_POST['userEmail']) && isset($_POST['userPassword']))
	{
		// proba logowania
		$userEmail = $_POST['userEmail'];
		$userPassword = $_POST['userPassword'];
		
		$db = connectDB();
		
		$query = 'SELECT * from users '
				 ."where mail='$userEmail'"
				 ."and password='".sha1($userPassword)."'";
				 
		$result = $db->query($query);
		if ($result->num_rows > 0)
		{
			// zalogowano poprawnie
			$_SESSION['id'] = $userEmail;
			header('Location: index.php');
		}
		
		$db->close();
	}
?>
<div class="page-title">
	<h1>Zaloguj się</h1>   
</div>
<div class="sing">
	<div class="sing-left">
	<?php
		if (isset($userEmail))
		{
			echo 'Nie udało się zalogować.<br>';
		}
	?>
		<form  method="post" action="zaloguj.php" class="zaloguj">
			<div class="input-line">
				<label for="userEmail">E-mail: </label>
				<input type="text" size="50" name="userEmail"> 
			</div>
			 <div class="input-line">
				<label for="userPassword">Hasło: </label>
				<input type="password" size="40" name="userPassword"> 
			</div>
			<div class="buttons">
				<button type="submit" class="button" value="zaloguj" name="submited">ZALOGUJ SIĘ</button>
			</div>
		</form>
	</div>  
	<div class="sing-right">
		<h2>
			Nie masz jeszcze konta?
		</h2>
			<a href="rejestracja.php" class="buttonr" title="Zarejestruj się">ZAREJESTRUJ SIĘ</a>
	</div>
</div>

<?php 
	require('footer.php');
?>