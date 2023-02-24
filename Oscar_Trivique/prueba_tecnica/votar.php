<?php
$rut=$_GET["rut"];
$nombre=$_GET["nombre"];
$apellido=$_GET["apellido"];
$alias=$_GET["alias"];
$email=$_GET["email"];
$id_candidato=$_GET["id_candidato"];
$web=$_GET["web"];
$tv=$_GET["tv"];
$redes=$_GET["redes"];
$amigo=$_GET["amigo"];

require_once("conexion.php");

$objeto= new conexion();
$conexion=$objeto->conexionBD();

$query="insert into votante (rut, nombre, apellido, alia, email, id_candidato, web, tv, redes, amigo) values ('$rut','$nombre','$apellido','$alias','$email', $id_candidato,'$web','$tv','$redes','$amigo')";

echo $query;

$sql=$conexion->prepare($query);
$sql->execute();

?>