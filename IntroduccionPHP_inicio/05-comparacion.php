<?php include 'includes/header.php';

$numero1 = 20;
$numero2 = 30;
$numero3 = 30;
$numero4 = '30';

var_dump($numero1 > $numero2);
echo "<br>";

var_dump($numero1 < $numero2);
echo "<br>";

var_dump($numero2 == $numero3); // doble signo de == va a revisar el valor! 
echo "<br>";

var_dump($numero2 === $numero4); // triple signo de === va a revisar valor y tipo de dato, es mas estricto! 
echo "<br>";

var_dump($numero1 <=> $numero2);// -1 SI IZQ ES MENOR
echo "<br>";

var_dump($numero2 <=> $numero3);// 0 SI SON IGUALES
echo "<br>";

var_dump($numero2 <=> $numero1);// -1 SI DER ES MAYOR
echo "<br>";







include 'includes/footer.php';