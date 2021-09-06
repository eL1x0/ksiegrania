<?php
	require_once('funkcje.php');
	require_once('header.php');
?>

<div class="page-title">
	<h1>Zarejestruj się</h1>   
</div>
<div class="sing">
	<div class="sing-left">
		<form  method="get" action="rejestracja.php" class="zaloguj">
			<div class="input-line">
				<label for="userEmail">E-mail: </label>
				<input type="text" name="userEmail">
			</div>
			 <div class="input-line">
				<label for="userPassword">Hasło: </label>
				<input type="password" name="userPassword"> 
			</div> 
			<div class="input-line">
				<label for="repeatPassword">Powtórz hasło: </label>
				<input type="password" name="repeatPassword"> 
			</div>
			<div class="buttons">
				<button type="submit" class="button" value="zaloguj">ZAREJESTRUJ SIĘ</button>
			</div>
		</form>
	</div>  
	<div class="sing-right">
		<h2>
			Masz już konto?
		</h2>
			<a href="" class="buttonr" title="Zarejestruj się">ZALOGUJ SIĘ</a>
	</div>
</div>

<?php
	require('footer.php');
?>