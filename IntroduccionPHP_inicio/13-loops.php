<?php include 'includes/header.php';

// while : comprueba y luego ejecuta si hace falta

$i = 0; // Inicializador

    while($i < 10){                      // tambien para abrir el while podria hacerlo con :
        echo $i . "<br>";
        $i ++; //incremento              
       }                                 // y podria cerrarlo con un endwhile;

echo "<br>";

// do while: al menos se ejecuta una vez 

$i=0;

do{
    echo $i."<b                      // tambien para abrir el while podria hacerlo con :r>";
    $i++;
}while($i < 10);                 
                     // y podria cerrarlo con un endwhile;
echo "<br>";

// For loop

for($i=0; $i < 10; $i++) {
    echo $i . "<br>";
}

echo "<br>";

// // PRUEBA DE PROGRAMADOR

// for($i=1;$i < 100; $i++){                                        // MUY IMPORTANTE DONDE COLOCO PRIMERO CADA IF
//     if($i % 3 === 0 && $i % 5 === 0){echo $i .'-FIZZ BUZZ <br>';}
//     elseif($i % 3 === 0){echo $i. '-FIZZ <br>';}elseif(
//         $i % 5 === 0){echo $i .'-BUZZ <br>';} else{echo $i. "<br>";}
// }



// FOR EACH

$clientes = array('Pedro','Karen','Maria');

foreach( $clientes as $cliente ) : 
    echo $cliente ."<br/>"; endforeach;

include 'includes/footer.php';