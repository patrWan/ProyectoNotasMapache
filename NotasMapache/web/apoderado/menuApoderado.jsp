<%@page import="model.Apoderado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%  
            //MySQL_PrivilegioDAO p = new MySQL_PrivilegioDAO();
            
            Apoderado a = (Apoderado) session.getAttribute("sesion"); 
            if(a == null){
                response.sendRedirect("error.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Apoderados</title>
    </head>
    <body>
        <h1><%out.println("Bienvenido! "+a.getNombre());%></h1>
        <%
            out.println("Rut: " + a.getRut());
            out.println("<br><a href='../cerrarSesion.do'>Cerrar Sesión</a>");
        %>
    </body>
</html>
