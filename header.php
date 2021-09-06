<?php
	session_start();
?>


<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#">
<head>
	<meta charset="UTF-8">
    <title>Księgarnia</title>
	<link rel="Stylesheet" type="text/css" href="css/style.css">
	<meta name="author" content="Jakub Zieliński">
	<meta name="description" content=Księgarnia">
	<meta name="viewport" content="width=1024, initial-scale=1">
</head>
<body>
<header class="top-bar">
	<div class="container">
		<div class="logo">
		 <a href="index.php">
			<img src="images/logorotate.png" width="135" height="70">
		</a></div>
		<div class="search">
			<form id="searching" method="post" action="szukaj.php">
				<input name="szukaj" type="text" placeholder="Wpisz tytuł lub autora" id="ProductQ" autocomplete="off" class="product">
				<input type="submit" value="Szukaj" class="szukaj">
			</form>
		</div>
		<?php
		if (!isset($_SESSION['id'])){
			echo '<div class="user-panel">
				<a href="zaloguj.php">Zaloguj się</a><br>
				<a href="rejestracja.php">Zarejestruj się</a><br>
				
			</div>';}
			else {
				echo '<div class="user-panel">
				<a href="konto.php">Konto</a><br>
				
				<a href="basket.php">Koszyk';
				if (count($_SESSION['basket']) > 0)
					echo '('.count($_SESSION['basket']).')';
				echo '</a>
			</div>';
			}
		?>

		
	</div>
</header>
<div class="content">
    <div class="container">