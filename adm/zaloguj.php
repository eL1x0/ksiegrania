<?php
	require_once('../funkcje.php');
	require_once('header.php');
	
	if (isset($_SESSION['admin']))
		header('Location: index.php');
	
	if (isset($_POST['nick']) && isset($_POST['userPassword']))
	{
		// proba logowania
		$nick = $_POST['nick'];
		$userPassword = $_POST['userPassword'];
		
		$db = connectDB();
		
		$query = 'SELECT * from admin '
				 ."where nick='$nick'"
				 ."and haslo='".sha1($userPassword)."'";
				 
		$result = $db->query($query);
		if ($result->num_rows > 0)
		{
			// zalogowano poprawnie
			$_SESSION['admin'] = $nick;
			header('Location: index.php');
			echo 'ok';
		}
		
		$db->close();
	}
?>
<div class="page-title">
	<h1>Panel admina</h1>   
</div>
<div class="sing">
	<div class="singadm">
	<?php
		if (isset($nick))
		{
			echo 'Nie udało się zalogować.<br>';
		}
	?>
		<form  method="post" action="zaloguj.php" class="zaloguj">
			<div class="input-line">
				<label for="userEmail">Nick: </label>
				<input type="text" size="20" name="nick"> 
			</div>
			 <div class="input-line">
				<label for="userPassword">Hasło: </label>
				<input type="password" size="40" name="userPassword"> 
			</div>
			<div class="buttons">
				<button type="submit" class="buttonadm" value="zaloguj" name="submited">ZALOGUJ SIĘ</button>
			</div>
		</form>
	 
    </div>
</div>

<?php 
	require('../footer.php');
?>