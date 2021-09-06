<?php
	require_once('funkcje.php');
	require_once('header.php');
	error_reporting(0);
	
	if (isset($_POST['submitted']))
	{
		$isbn = $_POST['isbn'];
		$numOfBook = $_POST['quantity'];
		if (isISBNValid($isbn) && is_numeric($numOfBook))
		{
			if (isset($_SESSION['basket'][$isbn]))
				$_SESSION['basket'][$isbn] += $numOfBook;
			else
				$_SESSION['basket'][$isbn] = $numOfBook;
		}	
	}
	if (isset($_POST['delete']))
	{
		$isbn = $_POST['isbn'];
		
		if (isset($_SESSION['basket'][$isbn]))
			unset($_SESSION['basket'][$isbn]);
	}
	$sumOfOrder = 0;
	if (isset ($_SESSION['basket']))
	foreach ($_SESSION['basket'] as $ISBN => $quantity)
	{
		$book = p_opis_ksiazki($ISBN);
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
					Ilość: <?php echo $quantity; ?> szt.<br>
					Całkowita wartość: <?php echo $quantity * $book['price']; ?> zł
					
					<form method="post" action="basket.php">
						<div class="buttons">
								<button type="submit" class="book-details-left-button" value="Usuń">Usuń</button>
						</div>
						<input type="hidden" name="delete">
						<input type="hidden" name="isbn" value="<?php echo $book['ISBN']; ?>">
					</form>
				</div>
			</div>
		</div>
<?php
		$sumOfOrder += $quantity * $book['price'];	
	}
?>

<div>
Wartość zamówionych rzeczy:
<?php
	echo $sumOfOrder;
?>
	zł
	<br><br>

</div>
<div class="buttons text-align-right">
	<a href="proceed.php">
		<button class="book-details-left-button" value="Przejdź do kasy">Przejdź do kasy</button>
	</a>
</div>
<?php
	require('footer.php');
?>