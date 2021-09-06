<?php
	require_once('funkcje.php');
	require_once('header.php');
	$dane_klienta=$_SESSION['id'];
?>

<div class="panel-klienta">
            <div class="l-panel">
                <ul>
                    <li><a href="dane.php">Dane</a></li>
                    <li><a href="konto.php">Moje zamówienia  </a></li>
                    <li><a href="basket.php">Koszyk</a></li>
					<li><a href="invite.php">Polecenia </a></li>
                </ul>
            </div>
            <div class="r-panel">
			<div class="m-zamowienia">
                        <h2>ZAPRASZANIE PRZYJACIÓŁ</h2>
						
               <div style="padding-top: 20px">
					Twój kod polecający dla znajomych to: <b><?php echo $dane_klienta ?></b>
			   </div>
               <div style="padding-top: 30px">
					Posiadasz następującą ilość punktów: <b><?php echo numberPoints(); ?></b>
			   </div>
                       
                           
            </div>
        
                            
            </div>
   <?php