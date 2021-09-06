<?php
	require_once('../funkcje.php');
	require_once('header.php');
	
	if (!isset($_SESSION['admin']))
		header('Location: zaloguj.php');
	
	if (isset($_POST['submitted']))
	{
		$ISBN = $_POST['ISBN'];
		$title = $_POST['title'];
		$author = $_POST['author'];
		$publishing = $_POST['publishing'];
		$page = $_POST['page'];
		$print = $_POST['print'];
		$category = $_POST['category'];
		$price = intval($_POST['price']);
		$description = $_POST['description'];
		$data_d = date("Y-m-d H:i");
		
		$error = false;
		if (!isFilled($_POST))
		{
			echo 'Nie wszystkie pola formularza zostały wypełnione. Spróbuj ponownie.<br>';
			$error = true;
		}
		if (strlen($title) > 255)
		{
			echo 'Tytuł jest zbyt długi.<br>';
			$error = true;
		}
		if ((strlen($author) > 100))
		{
			echo 'Autor jest zbyt długi.<br>';
			$error = true;
		}
		
		
		if ($_FILES['cover']['error'] > 0)
		{
			$error = true;
			switch ($_FILES['cover']['error'])
			{
				case 1:
				case 2: echo 'Rozmiar pliku przekroczył maksymalną wartość.'; break;
				case 3: case 6: case 7: echo 'Wysyłanie pliku nie powiodło się. Spróbuj ponownie.'; break;
				case 4: echo 'Musisz wysłać obrazki okładki.'; break;
			}
		}
		
		if ($_FILES['coverThumb']['error'] > 0)
		{
			$error = true;
			switch ($_FILES['coverThumb']['error'])
			{
				case 1:
				case 2: echo 'Rozmiar pliku przekroczył maksymalną wartość.'; break;
				case 3: case 6: case 7: echo 'Wysyłanie pliku nie powiodło się. Spróbuj ponownie.'; break;
				case 4: echo 'Musisz wysłać obrazki okładki.'; break;
			}
		}
		
		$filename = rand(1000000,9999999).basename($_FILES['cover']['name']);
		$localization = '../images/cover/'.$filename;
		while (file_exists($localization))
		{
			$filename = rand(1000000,9999999).basename($_FILES['cover']['name']);
			$localization = '../images/cover/'.$filename;
		}
		$localization2 = '../images/coverThumb/'.$filename;
		
		
		if (is_uploaded_file($_FILES['cover']['tmp_name']))
		{
			if (!move_uploaded_file($_FILES['cover']['tmp_name'], $localization))
			{
				$error = true;
			}
		}
		else
		{
			$error = true;
		}
		if (is_uploaded_file($_FILES['coverThumb']['tmp_name']))
		{
			if (!move_uploaded_file($_FILES['coverThumb']['tmp_name'], $localization2))
			{
				
				$error = true;
			}
		}
		else
		{
			$error = true;
		}
	
		
		$db = connectDB();
		$query = $db->query("SELECT id from podkategorie WHERE id='".$category."'");
		
		$numRows = $query->num_rows;
		if (!$query || !($numRows > 0))
		{
			echo 'Podana kategoria nie istnieje.<br>';
			$error = true;
		}
		if (strlen($description) > 9000000)
		{
			echo 'Opis jest zbyt długi.<br>';
			$error = true;
		}
		
		if (!$error)
		{
			if (addBook($ISBN, $title, $author, $publishing, $page, $print, $category, $price, $description, $filename, $data_d))
			{
?>
	Książka została dodana poprawnie!

<?php
			}
		}
		else
		{
			if (file_exists($localization)) unlink($localization);
			if (file_exists($localization2)) unlink($localization2);
		}
	}
?>
<div class="page-title">
	<h1>Dodaj książkę</h1>   
</div>
<div class="sing">
	<div class="sing-left">
		<form  method="post" action="dodaj_ksiazke.php" class="zaloguj" ENCTYPE="multipart/form-data">
			<input type="hidden" name="MAX_FILE_SIZE" value="10000000">
			<div class="input-line">
				<label for="ISBN">ISBN: </label>
				<input type="text" size="25" name="ISBN" value="<?php echo $ISBN; ?>"> 
			</div>
			<div class="input-line">
				<label for="title">Tytuł książki: </label>
				<input type="text" size="255" name="title" value="<?php echo $title; ?>"> 
			</div>
			<div class="input-line">
				<label for="author">Autor książki: </label>
				<input type="text" size="100" name="author" value="<?php echo $author; ?>"> 
			</div>
			<div class="input-line">
				<label for="author">Wydawnictwo: </label>
				<input type="text" size="40" name="publishing" value="<?php echo $publishing; ?>"> 
			</div>
			<div class="input-line">
				<label for="author">Liczba stron: </label>
				<input type="text" size="10" name="page" value="<?php echo $page; ?>"> 
			</div>
			<div class="input-line">
				<label for="author">Oprawa: </label>
				<input type="text" size="40" name="print" value="<?php echo $print; ?>"> 
			</div>
			<div class="input-line">
				<label for="category">Kategoria: </label>
				<?php createSelectCategories(); ?>
			</div>
			<div class="input-line">
				<label for="price">Cena: </label>
				<input type="text" name="price" value="<?php echo $price; ?>">
			</div>
			<div class="input-line">
				<label for="description">Opis: </label>
				<textarea name="description" cols="100" rows="5"><?php echo $description ?></textarea>
			</div>
			<div class="input-line">
				<label for="cover">Okładka: </label>
				<input type="file" name="cover" id="cover">
			</div>
			<div class="input-line">
				<label for="coverThumb">Miniaturka: </label>
				<input type="file" name="coverThumb" id="coverThumb">
			</div>
			<div class="buttons">
				<button type="submit" class="button" value="zaloguj" name="submited">DODAJ KSIAŻKĘ</button>
			</div>
			<input type="hidden" name="submitted" value="1">
		</form>
	</div>  
	<div class="sing-right">
	</div>
</div>


<?php
	require_once('footer.php');
?>