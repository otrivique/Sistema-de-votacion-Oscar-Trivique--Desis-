<?php
include("parametros_conexion.php");

class conexion{

    public function conexionBD(){
       
        try{
            $conn= new PDO ("pgsql:host=".SERVER." dbname=".DBNAME." user=".USER." password=".PASS);
            return $conn;
        }
        catch(Exception $error){
            die ("No se pudo conectar correctamente a la base de datos, el error es: $error");
        }


        
    }


}
?>







