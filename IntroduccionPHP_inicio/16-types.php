<?php 
declare(strict_types=1);
include 'includes/header.php';

function usuarioAutenticado(bool $Autenticado) :void {     // el void es para que avisar que retorna algo impreso
    if($Autenticado){ echo "El usuario esta autenticado";}
    else{echo 'Error al iniciar sesion';}
   
}

$usuario = usuarioAutenticado(true);
echo $usuario;

echo $usuario;



include 'includes/footer.php';
