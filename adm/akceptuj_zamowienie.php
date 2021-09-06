<?php
	require_once('../funkcje.php');
	require_once('header.php');
	
	if (!isset($_SESSION['admin']))
		header('Location: zaloguj.php');
	
	if (isset($_POST['submitted']))
	{
		$id = $_POST['id'];
		if (acceptOrder($id))
			echo "Zamównienie zostałow zaakceptowane.";
	}
?>	
<div class="m-zamowienia">
	<h2>ZAMÓWIENIA</h2>
		<table class="orders">
<?php
			showCustomersOrders();
?>
		</table>
</div>
<?php
	require_once('footer.php');
?>