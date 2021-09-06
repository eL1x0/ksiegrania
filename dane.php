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
               
                    <?php
                    	daneu($dane_klienta);
                    ?>
                    <a href="edycjadanych.php">Edytuj</a>
                       
                           
             </div>
        
                            
            </div>
   <?php