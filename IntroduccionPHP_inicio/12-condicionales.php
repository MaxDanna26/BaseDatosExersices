<?php include 'includes/header.php';

$autenticado = true;

if($autenticado) {
    echo 'Usuario autenticado correctamente';} else{
        echo 'Usuario no autenticado';
    }

// IF anidados.

$cliente = [
    'Nombre' => 'Juan',
    'Saldo' => 200,
    'Informacion' => [
        'Tipo' => 'Premium'
    ]
    ];
echo "<br>";


// Va a ser util para autenticar usuarios, revisar datos, etc
    if( !empty($cliente) ) {
        echo 'El arreglo del cliente NO esta vacio.';
        if( $cliente['Saldo'] < 0) {echo 'El cliente tiene saldo disponible';}
        else{echo 'El cliente no tiene saldo.';}
    };

echo "<br>";


// ELSE IF
if($cliente['Saldo'] > 0 ) {echo 'El cliente tiene saldo.';}
else if($cliente['Informacion']['Tipo'] === 'Premium'){
    echo 'El cliente es premium.';
} else{echo "El cliente no es nadie ni tiene saldo.";}

// Swicth! 

$tegnologia = 'PHP';

switch($tegnologia) {
    case 'PHP' :
        echo 'Php, excelente lenguaje!'; break;
    case 'Javascript':
        echo 'Lo mejor a estudiar!'; break;
    default: 'Cualquier otro lenguaje!'; break;
}

include 'includes/footer.php';