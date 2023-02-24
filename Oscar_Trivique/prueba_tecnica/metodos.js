$(document).ready(function(){
    $("#votar").click(function(){
        var nombre=' ';
        var apellido=' ';

        var nom=$("#nombre").val();
        var alias=$("#alias").val();
        var rut=$("#rut").val();
        var email=$("#email").val();
        var region=$("#cbxRegion").val();
        var comuna=$("#cbxComuna").val();
        var id_candidato=$("#cbxCandidato").val();
        var web=$("#web").prop("checked");
        var tv=$("#tv").prop("checked");
        var redes=$("#redes").prop("checked");
        var amigo=$("#amigo").prop("checked");
        nombre =obtenerNom(nom);
        apellido=obtenerApellido(nom);


        var valNom=validarVacio(nombre);
        var valEmail=validarCorreo(email);
        var valAlias=validarAlias(alias);
        var valRut=validarRut(rut);
        var valChk=validarChk(web,tv,redes,amigo);

        if(valNom==true && valEmail==true && valAlias==true && valRut==true && valChk==true){
            $.get("votar.php", {rut:rut, nombre:nombre, apellido:apellido, alias:alias, email:email, id_candidato:id_candidato, web:web, tv:tv, redes:redes, amigo:amigo}, function(respuesta){
                alert("votacion exitosa");
            });

        }

        
    });
});


    



function obtenerNom(nom){
    if (nom.toString().trim() != '' && nom.toString().indexOf(' ') > 0) {
        var arr = nom.split(' ');
        nombre =arr[0];

        return nombre;
    }

}



function obtenerApellido(nom){
    if (nom.toString().trim() != '' && nom.toString().indexOf(' ') > 0) {
        var arr = nom.split(' ');
        apellido =arr[1];

        return apellido;
    }

}
        
        
        




function validarVacio(texto){
    if (texto.length == 0 || /^\s+$/.test(texto)) {
        alert('El campo del nombre esta vacio!');
        return false;
    }else{
        return true;
    }
}



function validarCorreo(email){
    
    var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);

    if (caract.test(email) == false){
        alert('el correo es invlido');
        return false;
    }else{
        alert('el correo es valido');
        return true;
    }
}



function validarAlias(alias){
    
    var caract = new RegExp(/^[a-zA-Z0-9]{5,12}$/);

    if (caract.test(alias) == false){
        alert('el alias es invalido, debe contener un minimo de 5 caracteres entre numeros y letras');
        return false;
    }else{
        alert('el alias es valido');
        return true;
    }
}


function validarRut(rut){
    
    var caract = new RegExp(/^[0-9]{2,9}$/);

    if (caract.test(rut) == false){
        alert('el rut es invalido, porfavor ingrese el rut sin guiones ni puntos, solo numeros y con digito verificador');
        return false;
    }else{
        result=verificaRut(rut);
        return result;
    }
}



function verificaRut(rut) {
    
    rut=rut.substr(0,rut.length-1)+'-'+rut.substr(rut.length-1)

    if (rut.toString().trim() != '' && rut.toString().indexOf('-') > 0) {
        var caracteres = new Array();
        var serie = new Array(2, 3, 4, 5, 6, 7);
        var dig = rut.toString().substr(rut.toString().length - 1, 1);
        rut = rut.toString().substr(0, rut.toString().length - 2);

        for (var i = 0; i < rut.length; i++) {
            caracteres[i] = parseInt(rut.charAt((rut.length - (i + 1))));
        }

        var sumatoria = 0;
        var k = 0;
        var resto = 0;

        for (var j = 0; j < caracteres.length; j++) {
            if (k == 6) {
                k = 0;
            }
            sumatoria += parseInt(caracteres[j]) * parseInt(serie[k]);
            k++;
        }

        resto = sumatoria % 11;
        dv = 11 - resto;

        if (dv == 10) {
            dv = "K";
        }
        else if (dv == 11) {
            dv = 0;
        }

        if (dv.toString().trim().toUpperCase() == dig.toString().trim().toUpperCase())
            return true;
        else
            return false;
    }
    else {
        return false;
    }
}


function validarChk(web, tv, redes, amigo){
    conta=0;
    if(web==true){
        conta++;
    }
    if(tv==true){
        conta++
    }
    if(redes==true){
        conta++;
    }
    if(amigo==true){
        conta++
    }

    if(conta>=2){
        return true;
    }else{
        alert("Porfavor seleccione al menos opciones en la seccion 'Como se entero de Nosotros' ");
        return false;
    }
}





function recargarListaComuna(){
    alert("llega a istado comuna");
    $.ajax({
        type:"POST",
        url:"listar_comuna.php",
        data:"id_region="+ $('#cbxRegion').val(),
        success: function(r){
            $('#divCbxComuna').html(r);
        }


    });
}




function recargarListaCandidato(){
    alert("llega a listado candidato");
    $.ajax({
        type:"POST",
        url:"listar_candidato.php",
        data:"id_comuna="+ $('#cbxComuna').val(),
        success: function(r){
            $('#divCbxCandidato').html(r);
        }

    });
}

