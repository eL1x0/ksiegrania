<?php
	require_once('funkcje.php');
	require_once('header.php');
	
?>

<aside class="navbar">
	<h2>Menu</h2>
	<nav>
		<ul>
			<?php 
				if (!listCategories())
					echo 'Brak kategorii do wyświetlenia';
			?>
		</ul>
	</nav>
</aside>
<section class="main-content">
	<h2>Nowości</h2>
	
	<?php
      nowosci();
	?>
		

</section>

<?php
	require_once('footer.php');
?>