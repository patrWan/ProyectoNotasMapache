<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Docente</title>
    </head>
    <body>
        <h1>Registro Docente</h1>
        <form method="POST" action="../registrarDocente.do">
            <input type="text" name="txtRut" placeholder="Ingrese Rut:" required=""><br>
            <input type="text" name="txtNombre" placeholder="Ingrese Nombre:" required=""><br>
            <input type="text" name="txtApellido" placeholder="Ingrese Apellido:" required=""><br>
            <input type="text" name="txtDireccion" placeholder="Ingrese Direccion:" required=""><br>
            <input type="text" name="txtCorreo" placeholder="Ingrese Correo:" required=""><br>
            <input type="text" name="txtUsuario" placeholder="Ingrese Usuario:" required=""><br>
            <input type="text" name="txtPass" placeholder="Ingrese Contraseña:" required=""><br>
            <input type="submit" value="Registrar">
        </form>
        <br>
        <a href='menuAdmin.jsp'>Volver</a>
    </body>
</html>
