<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <script src="jquery/jquery.js" type="text/javascript"></script>
        <script src="js/index.js" type="text/javascript"></script>
    </head>
    <body>
        <form name="frmAutenticacion" id="frmAutenticacion" method="post">
    <table width="200" border="1" align="center">
      <tr>
        <th scope="row">Usuario</th>
        <td><label>
          <input name="txtUsuario" type="text" id="txtUsuario">
        </label></td>
      </tr>
      <tr>
        <th scope="row">Contraseña</th>
        <td><input name="txtContrasenia" type="password" id="txtContrasenia"></td>
      </tr>
      <tr>
        <th colspan="2" scope="row"><label>
                <input name="btnAceptar" type="button" id="btnAceptar" value="ACEPTAR">
        </label></th>
      </tr>
    </table>
	</form>
    </body>
</html>
