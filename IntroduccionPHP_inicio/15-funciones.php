<?php 
declare(strict_types=1);
include 'includes/header.php';

function sumar(int $numero1 = 0, int $numero2 = 0){ // el cero se agrega para que tenga un parametro por default
    echo $numero1 + $numero2;
}

sumar(100,200);


include 'includes/footer.php';