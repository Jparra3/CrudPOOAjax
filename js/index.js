$(function (){
    $("#btnAceptar").click(function (){
        var data = $("#frmAutenticacion").serialize();
        $.ajax({
            url:'controlador/usuario.autenticar.php'
            , type:'POST'
            , dataType:'json'
            , data:data
            , success:function (resultado){
                if(resultado.exito === 0){
                    alert(resultado.mensaje);
                    return false;
                }
                window.location = 'vista/FrmInicio.php';
            }, error:function(xhr, status, error){
                alert("Error: "+error);
            }
        });
    });
});