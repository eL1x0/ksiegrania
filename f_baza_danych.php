<?php

function connectDB()
{
	$db = new mysqli('localhost', 'root', '', 'ksiegarnia');
	if (!$db)
	{
		echo 'Połączenie z bazą danych nie powiodło się: '.mysqli_connect_error();
		exit();
	}
	else
		return $db;
}