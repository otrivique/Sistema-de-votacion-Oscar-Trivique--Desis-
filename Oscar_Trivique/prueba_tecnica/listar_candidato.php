<?php
require_once("conexion.php");
$objeto= new conexion();
$conexion=$objeto->conexionBD();

$comuna=$_POST["id_comuna"];



$query="select id_candidato, nombre_candidato from candidato where id_comuna =$comuna";


$sql=$conexion->prepare($query);
$sql->execute();


$datos=$sql->fetchAll();


echo "<div class='column'><label>Candidato</label></div>";
echo "<div class='column'><select id='cbxCandidato' name='cbxCandidato'>";
echo "<option value='0'>Seleccione un candidato </option>";


foreach($datos as $fila){
    echo "<option value='".$fila["id_candidato"]."'>".$fila["nombre_candidato"]."</option>";
}

echo "</select></div>";

?>