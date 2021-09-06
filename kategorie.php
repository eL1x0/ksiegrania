<?php
require_once('funkcje.php');
require_once('header.php');

$id= $_GET['id'];

$kategoria = p_kategorie($id);
?>

<div class="page-title">
			<h2><?php echo $kategoria['nazwa'] ?> </h2>
			<form action="http://helion.pl/kategorie/aplikacje-biurowe" id="sortowanie" method="post">
				<fieldset>
					<div class="select-line select-line-cat"></div>
				
					
					
				</fieldset>
			</form>
		</div>
		<aside class="navbar">
			<h2>Podkategorie</h2>
			<nav>

				<?php 
				if (!listSubCategories($id))
					echo 'Brak podkategorii do wyświetlenia';
				?>

			</nav>
		</aside>
		<section class="main-content">
			
			<?php
				p_ksiazki_k($id)
			?>
			</div>
		</section>
	</div>




<?php
	require('footer.php');
?>