<%-- 
    Document   : index
    Created on : 30-abr-2018, 20:28:28
    Author     : Patricio
--%>

<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Sesión</title>
        <link
            rel = "stylesheet"
            href = "css/styles.css"
            type = "text/css"
            >
    </head>
    <body>
        <%if (request.getParameter("error") != null) {
                out.println("<script> alert('Datos Invalidos');</script>");
            }
        %>

        <img class="imgInicio" src="images/op2.jpg">

        <h2 class="txtInicio">Introduce Tú Usuario Para Iniciar Sesión</h2>
        <form class="formInicio" method="POST" action="IniciarSesion.do">
            <input id="txtUsuario"  type="text" name="txtUser" placeholder="Ingrese Usuario:" required=""><br>
            <input id="txtPass"  type="password" name="txtPass" placeholder="Ingrese Contraseña:" required=""><br>
            <input id="btnInciarSesion" type="submit" value="Iniciar Sesion">
        </form>
    </body>
</html>
