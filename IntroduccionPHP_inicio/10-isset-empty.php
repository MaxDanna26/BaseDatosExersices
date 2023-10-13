<?php

use JetBrains\PhpStorm\ArrayShape;

 include 'includes/header.php';

$cliente = []; // otra manera de crear arreglo
$cliente2 = Array(); // una manera de crear arreglo
$cliente3 = ['Juan', 'Pedro' , 'Karen'];
$cliente = ['nombre' => 'Juan',
'saldo' => 200];

// Empty: para revisar si un arreglo esta vacio
var_dump(empty($cliente));
var_dump(empty($cliente3));

// ISSET - Revisa si un arreglo esta creado o una propiedad definida

echo "<br>";
var_dump(isset($cliente4));
var_dump(isset($cliente2));

// ISSET - Tambien va a permitir revisar si existe una propiedad de un arreglo asociativo existe! 
echo "<br>";
var_dump(isset($cliente['nombre']));

include 'includes/footer.php';