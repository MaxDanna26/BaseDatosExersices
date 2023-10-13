<?php include 'includes/header.php';

// IN ARRAY - buscar elementos dentro de un arreglo

$carrito = ['Tablet','Ordenador','Television'];

var_dump(in_array('Tablet',$carrito));
var_dump(in_array('Audifonos',$carrito));

// Ordenador elementos en un arreglo

$numeros = array(1,2,5,4,3);
sort($numeros); // de menor a mayor 
rsort($numeros); // de mayor a menor
 
echo "<pre>";
var_dump($numeros);
echo "</pre>";

// Ordenador arreglo asociativo! 

$cliente = array('saldo' => 200,
'tipo' => 'Premium',
 'Nombre' => 'Juan');

asort($cliente); // Ordena por valores, en este caso, primero numeros luego orden alfabetico
ksort($cliente); // Ordena alfabeticamente las llaves
krsort($cliente); // Ordena alfabeticamente las llaves pero a la inversa



echo "<pre>";
var_dump($cliente);
echo "</pre>";


include 'includes/footer.php';