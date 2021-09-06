<?php
require_once('funkcje.php');
require_once('header.php');

$isbn = $_GET['isbn'];

$ksiazka = p_opis_ksiazki($isbn);


?>

<div class="book-details">
		<div class="book-details-left">
			<div class="book-details-left-cover">
				<?php echo "<img src=\"images/cover/".$ksiazka['img_name']."\" width=\"220\" height=\"330\">" ?>
			</div>
			<div class="book-details-left-info">
				<div class="titlebook">
				<h2> <?php echo $ksiazka ['title']; ?> </h2>
				</div>
				Autor: <b><?php echo $ksiazka ['author']; ?></b>
				
			
				<ul>
					<li>Wydawnictwo: <?php echo $ksiazka ['publishing']; ?></li>
					<li>Stron: <?php echo $ksiazka ['page']; ?> </li>
					<li>Oprawa: <?php echo $ksiazka ['print']; ?> </li>
					<li>ISBN: <?php echo $ksiazka ['ISBN']; ?></li>
					<li>Dostępność: Wysyłamy w 24h </li>
					<li>Cena: <?php echo $ksiazka ['price']; ?>.00 zł</li>
					
				</ul>
				
				<div class="book-details-left-price">
					<form method="post" action="basket.php">
						 <br>
						Ilość: 
						<select class="prod_quantity" name="quantity">
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
						  <option value="6">6</option>
						  <option value="7">7</option>
						  <option value="8">8</option>
						  <option value="9">9</option>
						  <option value="10">10</option>
						  <option value="11">11</option>
						  <option value="12">12</option>
						  <option value="13">13</option>
						  <option value="14">14</option>
						  <option value="15">15</option>
						  <option value="16">16</option>
						  <option value="17">17</option>
						  <option value="18">18</option>
						  <option value="19">19</option>
						  <option value="20">20</option>
						</select>
						szt.
						
						<div class="buttons">
								<button type="submit" class="book-details-left-button" value="Dodaj do koszyka">Dodaj do koszyka</button>
						</div>
						<input type="hidden" name="submitted">
						<input type="hidden" name="isbn" value="<?php echo $ksiazka['ISBN']; ?>">
					</form>
				</div>
				
			</div>
		</div>
	</div>
	<div class="book-description">
		<h2>Opis książki</h2>
		<h3><?php echo $ksiazka ['title']; ?></h3>
		<p>
			<?php echo nl2br($ksiazka['description']); ?>
		</p>
		
	</div>

<?php
	require('footer.php');
?>