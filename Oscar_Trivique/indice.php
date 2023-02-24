<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prueba tecnica</title>
    <script src="./prueba_tecnica/jquery-3.6.1.min.js"></script>
    <script src="./prueba_tecnica/metodos.js"></script>
    <link rel="stylesheet" type="text/css" href="./prueba_tecnica/estilo.css">
</head>
<body>


    

<div class="contenedor">   
    <h1>FORMULARIO DE VOTACION:</h1>

    <form action="" method="post">

    <div class="row ">
        <div class="column"><label >Nombre y Apellido</label></div>
        <div class="column"><input type="text" id="nombre"></div>
    </div>

    <div class="row ">
        <div class="column"><label> Alias</label></div>
        <div class="column"><input type="text" id="alias"></div>
    </div>

    <div class="row ">
        <div class="column"><label> RUT</label></div>
        <div class="column"><input type="text" id="rut"></div>
    </div>

    <div class="row ">
        <div class="column"><label >Email</label></div>
        <div class="column"><input type="text" id="email" ></div>
    </div>

    <div class="row ">
        <?php
            include_once ("prueba_tecnica/listar_region.php");
           
        ?>
    </div>

    <div id="divCbxComuna" name="divCbxComuna" class="row ">
        <div class="column">
            <label >Comuna</label></div>
        <div class="column">
            <select name="cbxComuna" id="cbxComuna">
                <option value="0">Seleccione una comuna</option>
            </select>
        </div>
    </div>

    <div id="divCbxCandidato" name="divCbxCandidato" class="row ">
        <div class="column">
            <label >Candidato</label>
        </div>
        <div class="column">
            <select name="cbxCandidato" id="cbxCandidato">
                <option value="0">Seleccione un candidato</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="columnchk"><label >Como se entero de Nosotros</label></div>
        <div class="columnchk">
            <input type="checkbox" id="web">Web</input>
            <input type="checkbox" id="tv">TV</input>
            <input type="checkbox" id="redes">Redes sociales</input>
            <input type="checkbox" id="amigo">Amigo</input>
        </div>
    </div>
    
    <div>
        <button id="votar" >Votar</button>
    </div>
    </form>
</div>




</body>
</html>