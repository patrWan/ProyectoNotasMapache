<%-- 
    Document   : menuAlumno
    Created on : 30-abr-2018, 21:52:05
    Author     : Patricio
--%>

<%@page import="model.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%  Alumno a = (Alumno) session.getAttribute("alumno"); 
            if(a == null){
                response.sendRedirect("error.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido <%out.print(a.getNombre() +" "+ a.getApellido());%></title>
    </head>
    <body>
        <h1><%out.print("Hola! "+ a.getNombre());%></h1>
        <%
        out.println("<a href='cerrarSesion.do'>Cerrar Sesión</a>");
        %>
    </body>
</html>
