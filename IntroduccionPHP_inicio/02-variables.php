<?php include 'includes/header.php';

// SIGNO DOLAR REPRESENTA CREACION DE UNA VARIABLE


$nombre = 'Juan'; // para crear variables, respetar las mismas leyes de javascript

$_nombre = 'Pedro'; // a diferencia de java, si se puede comenzar con un guion bajo

echo $nombre;

var_dump($nombre);

define('constante',"Este es el valor de la constante"); // primero el nombre, luego su valor


echo constante; // para mandarlo a llamar, debe ser sin el signo dolar!

const constante2 = "Hola 2"; // forma no tan utilizada el dia de hoy
echo constante2;

include 'includes/footer.php';
