<?php include 'includes/header.php';

$carrito = ['Tablet','Television','Computadora'];

// Util para ver los contenidos de un array
echo "<pre>";
var_dump($carrito);
echo "</pre>";

// Acceder a un elemento del array
echo $carrito[1];

// Agregar un elemento en el array al final
$carrito[3] = 'Nuevo producto...'; // lo malo es que tienes que saber la extension

// Añadir un elemento al final del array
array_push($carrito, 'Audifonos');

// Añadir al inicio
array_unshift($carrito, 'Smartwatch');


echo "<pre>";
var_dump($carrito);
echo "</pre>";

include 'includes/footer.php';