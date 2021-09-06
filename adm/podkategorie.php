<?php
	require_once('../funkcje.php');
	require_once('header.php');
	
	if (!isset($_SESSION['admin']))
		header('Location: zaloguj.php');
	
	if (isset($_POST['category']) && isset($_POST['subcategoryName']))
	{
		// proba logowania
		$category = $_POST['category'];
		$subcategoryName = $_POST['subcategoryName'];
		
		$db = connectDB();
		
		$query = 'SELECT * from podkategorie '
				 ."where nazwapod='$subcategoryName'";
				 
		$result = $db->query($query);
		if ($result->num_rows > 0)
			$message = "Taka podkategoria juz istnieje.";
		else
		{
			$query = $db->query("SELECT id, nazwa from kategorie WHERE id='".$category."'");	
		
			$numRows = $query->num_rows;
			if (!$query || !($numRows > 0))
			{
				echo 'Podana kategoria nie istnieje.<br>';
			}
			else
			{
				if (strlen($subcategoryName) > 60)
				{
					$message = "Podana nazwa podkategorii jest zbyt długa.";
				}
				else
				{
					$query = $db->query("INSERT INTO podkategorie values ('', '".$category."', '".$subcategoryName."')");
					if (!$query)
					{
						$message = "Wystąpił błąd podczas wykonywania zapytania do bazy danych. Proszę spróbować ponownie później.";
					}
					else
						$message = "Podkategoria dodana prawidłowo!";
				}
			}
		}
		
		$db->close();
	}
?>

<div class="page-title">
	<h1>Dodaj podkategorie</h1>   
</div>
<div class="sing">
	<div class="sing-left">
	<?php
		if (isset($message))
		{
			echo $message.'<br>';
		}
	?>
		<form  method="post" action="podkategorie.php" class="zaloguj">
			<div class="input-line">
				<label for="subcategoryName">Nazwa podkategorii: </label>
				<input type="text" size="20" name="subcategoryName"> 
			</div>
			<div class="input-line">
				<label for="category">Kategoria: </label>
				<?php listCategoriesToSelect(); ?>
			</div>
			<div class="buttons">
				<button type="submit" class="button" value="zaloguj" name="submited">DODAJ	PODKATEGORIĘ</button>
			</div>
		</form>
	</div>  
	<div class="sing-right">

	</div>
</div>


<?php
	require_once('footer.php');
?>