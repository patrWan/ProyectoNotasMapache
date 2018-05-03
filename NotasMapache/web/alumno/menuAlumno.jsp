<%-- 
    Document   : menuAlumno
    Created on : 30-abr-2018, 21:52:05
    Author     : Patricio
--%>

<%@page import="model.Privilegio"%>
<%@page import="factories.MySQL_PrivilegioDAO"%>
<%@page import="model.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //MySQL_PrivilegioDAO p = new MySQL_PrivilegioDAO();
            Alumno a = (Alumno) session.getAttribute("sesion");
            if (a == null) {
                response.sendRedirect("error.jsp");
            }

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Alumnos</title>
    </head>
    <body>
        
        <h1><%out.println("Bienvenido! "+a.getNombre());%></h1>
        <%
            out.println("Rut: " + a.getRut());
            out.println("<br><a href='../cerrarSesion.do'>Cerrar Sesión</a>");
        %>
    </body>
</html>
