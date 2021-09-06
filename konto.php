<?php
	require_once('funkcje.php');
	require_once('header.php');

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
                        <h2>MOJE ZAMÓWIENIA</h2>
                            <table class="p-tabele">
                                <?php
								  showOrder();
								?>
                            </table>
                    </div>
                       
                           
             </div>
        
                            
            </div>
   <?php
	require('footer.php');
?>  