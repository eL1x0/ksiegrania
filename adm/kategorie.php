<?php
	require_once('../funkcje.php');
	require_once('header.php');
	
	if (!isset($_SESSION['admin']))
		header('Location: zaloguj.php');
	
	if (isset($_POST['categoryName']))
	{
		// proba logowania
		$categoryName = $_POST['categoryName'];
		
		$db = connectDB();
		
		$query = 'SELECT * from kategorie '
				 ."where nazwa='$categoryName'";
				 
		$result = $db->query($query);
		if ($result->num_rows > 0)
			$message = "Taka kategoria juz istnieje.";
		else
		{
			if (strlen($categoryName) > 60)
			{
				$message = "Podana nazwa kategorii jest zbyt długa.";
			}
			else
			{
				$query = $db->query("INSERT INTO kategorie values ('', '".$categoryName."')");
				$message = "Kategoria dodana prawidłowo!";
			}
		}
		
		$db->close();
	}
?>

<div class="page-title">
	<h1>Dodaj kategorie</h1>   
</div>
<div class="sing">
	<div class="sing-left">
	<?php
		if (isset($message))
		{
			echo $message.'<br>';
		}
	?>
		<form  method="post" action="kategorie.php" class="zaloguj">
			<div class="input-line">
				<label for="categoryName">Nazwa kategorii: </label>
				<input type="text" size="20" name="categoryName"> 
			</div>
			<div class="buttons">
				<button type="submit" class="button" value="zaloguj" name="submited">DODAJ KATEGORIĘ</button>
			</div>
		</form>
	</div>  
	<div class="sing-right">
	
	</div>
</div>


<?php
	require_once('footer.php');
?>