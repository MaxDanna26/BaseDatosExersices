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

foreach($Productos as $Producto){ ?>

    <li> 
        <p>Producto: <?php echo $Producto['Nombre'];?> </p>
        <p>Precio: <?php echo "$" . $Producto['Precio'];?> </p>
        <p><?php echo ($Producto['Disponible']) ?"DISPONIBLE" :"NO DISPONIBLE";?> </p>
    </li>
    </br>
<?php

} 


include 'includes/footer.php';