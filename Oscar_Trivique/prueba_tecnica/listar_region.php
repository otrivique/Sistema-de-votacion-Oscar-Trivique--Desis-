<?php
        require_once("conexion.php");



        $objeto= new conexion();
        $conexion=$objeto->conexionBD();

        /* realiza la query */
        $query="select * from region";

        /* prepare() metodo de postgre que determina que consulta se va a ejecutar */
        $sql=$conexion->prepare($query);
        $sql->execute();

        /* leer todo el resultado devuelto de la consulta */
        $datos=$sql->fetchAll();

        /* muestra el tipo y contenido de una variable */

        $html ="<div class='column'><label>Region</label></div>
                <div class='column'><select id='cbxRegion' name='cbxRegion' onchange='recargarListaComuna()' >
                <option value='0'>Seleccione una Region</option>";


        foreach($datos as $fila){
            $id=$fila["id_region"];
            $nombre=$fila["nombre_region"];
            $html= $html ."<option value='$id'>$nombre</option>";
        }

        $html= $html. "</select></div>";


        echo $html;

        


?>