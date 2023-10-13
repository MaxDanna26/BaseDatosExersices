<?php include 'includes/header.php';


// Conocer extension de una cadena
$nombreCliente = "Juan Pablo";
echo strlen($nombreCliente);
echo "<br>";

var_dump($nombreCliente);
echo "<br>";

// Eliminar espacios en blanco
$texto = trim($nombreCliente);
echo strlen($texto);
echo "<br>";

// Convertirlo a mayuscula
echo strtoupper($nombreCliente);

// Convertirlo en minusculas
echo strtolower($nombreCliente);

// Podemos utilizar los upper o lower para comparar dos USUARIOS, no para imprimir texto 
// eso, tranquilamente, lo podemos hacer con CSS

echo str_replace('Juan', 'J', $nombreCliente);


// Revisar si existe una string

echo strpos($nombreCliente, 'Juan');

// Concatenar

$tipoCliente = "Premium.";
echo "<br>";


echo "El cliente " . $nombreCliente . " es " . $tipoCliente;




include 'includes/footer.php';