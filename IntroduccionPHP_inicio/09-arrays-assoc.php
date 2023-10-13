<?php include 'includes/header.php';

$cliente = [
'nomnbre' => 'Juan',
'saldo' => 200,
'informacion' => [
    'tipo' => 'premium'
]
];

echo "<pre>";
var_dump($cliente['informacion']); // para ingresar al arreglo informacion, habria que agregar otros corchetes
echo "</pre>";

// A diferencia de javascript, php en los arreglos los presenta con corchetes

$cliente['codigo'] = 123123413; // php es tan inteligente, que sabre que no existe esa variable
                                // y por lo tanto, la agregara automaticamente
                                // sino , la remplazara de ser de igual nombre


// Mientras que en java, los arreglos se presentan con un punto
// $cliente.codigo


include 'includes/footer.php';