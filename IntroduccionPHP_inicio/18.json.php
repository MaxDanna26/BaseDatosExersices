<?php include 'includes/header.php';

$Productos = [
    [   'Nombre' => 'Monitor curvo 24',
        'Precio' => '200',
        'Disponible' => true],
    [   'Nombre' => 'Smartphone',
        'Precio' => '300',
        'Disponible' => true],
    [   'Nombre' => 'Televisor 42',
        'Precio' => '400',
        'Disponible' => false]
    ];
    
    echo "<pre>";

    
    var_dump($Productos);
    $json = json_encode($Productos, JSON_UNESCAPED_UNICODE); // encode: convierte un arreglo a un string
    $json_array = json_decode($json); // mientras que decode convierte a la inversa

    var_dump($json);
    var_dump($json_array);

    echo "</pre>";


include 'includes/footer.php';