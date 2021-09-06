<?php
require_once('funkcje.php');
require_once('header.php');

$id= $_GET['id'];

$podkategorie = p_podkategorie($id);
?>

<div class="page-title">
			<h2><?php echo $podkategorie['nazwapod'] ?> </h2>
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
				if (!listSubCategories($id, 1))
					echo 'Brak podkategorii do wyświetlenia';
				?>

			</nav>
		</aside>
		<section class="main-content">
		
			<?php
				p_ksiazki_pk($id)
			?>
			</div>
		</section>
	</div>




<?php
	require('footer.php');
?>