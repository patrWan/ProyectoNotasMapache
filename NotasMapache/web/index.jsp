<%-- 
    Document   : index
    Created on : 30-abr-2018, 20:28:28
    Author     : Patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Sesión</title>
    </head>
    <body>
        <h1>Inicio De Sesión</h1>
        <form method="POST" action="IniciarSesion.do">
            <input type="text" name="txtUser" placeholder="Ingrese Usuario:"><br>
            <input type="text" name="txtPass" placeholder="Ingrese Contraseña:"><br>
            <input type="submit" value="Iniciar Sesion">
        </form>
    </body>
</html>
