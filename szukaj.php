<?php
	require_once('funkcje.php');
	require_once('header.php');

	$szukaj = $_POST['szukaj'];

?>
<div class="page-title">
			<h2>Szukasz "<?php echo $szukaj ?>" </h2>
		</div>

<?php 
szukaj($szukaj);
?>






<?php
	require('footer.php');
?>

