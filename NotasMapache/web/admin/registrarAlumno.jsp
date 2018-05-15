<%-- 
    Document   : registrarAlumno
    Created on : 06-may-2018, 16:28:50
    Author     : Patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Alumno</title>
    </head>
    <body>
        <h1>Registro alumno.</h1>
        
        <form method="POST" action="../registrarAlumno.do">
            <h4>Datos Apoderado</h4>
            <input type="text" name="txtRutApoderado" placeholder="Ingrese Rut:" required=""><br>
            <input type="text" name="txtNombreApoderado" placeholder="Ingrese Nombre:" required=""><br>
            <input type="text" name="txtApellidoApoderado" placeholder="Ingrese Apellido:" required=""><br>
            <input type="text" name="txtPassApoderado" placeholder="Ingrese Contraseña:" required=""><br>
            
            <h4>Datos Alumno</h4>
            <input type="text" name="txtRutAlumno" placeholder="Ingrese Rut:" required=""><br>
            <input type="text" name="txtNombreAlumno" placeholder="Ingrese Nombre:" required=""><br>
            <input type="text" name="txtApellidoAlumno" placeholder="Ingrese Apellido:" required=""><br>
            <input type="text" name="txtDireccionAlumno" placeholder="Ingrese Direccion:" required=""><br>
            <input type="text" name="txtPassAlumno" placeholder="Ingrese Contraseña:" required=""><br>
            
            <input type="submit" value="Registrar">
        </form>
        <a href='menuAdmin.jsp'>Volver</a>
    </body>
</html>
