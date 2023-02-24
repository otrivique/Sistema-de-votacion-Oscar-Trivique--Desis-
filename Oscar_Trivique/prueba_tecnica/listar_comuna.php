<?php
require_once("conexion.php");


$objeto= new conexion();
$conexion=$objeto->conexionBD();

$region=$_POST["id_region"];



$query="select id_comuna, nombre_comuna from comuna where id_region =$region";


$sql=$conexion->prepare($query);
$sql->execute();


$datos=$sql->fetchAll();


echo "<div class='column'><label>Comuna</label></div>";
echo "<div class='column'><select id='cbxComuna' name='cbxComuna' onchange='recargarListaCandidato()'>";
echo "<option value='0'>Seleccione una Comuna</option>";

foreach($datos as $fila){
    $id=$fila["id_comuna"];
    $nombre=$fila["nombre_comuna"];
    echo "<option value='$id'>$nombre</option>";
}

echo "</select></div>";




?>