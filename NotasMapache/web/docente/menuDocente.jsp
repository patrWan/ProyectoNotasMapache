<%@page import="factories.MySQL_PrivilegioDAO"%>
<%@page import="model.Docente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%  
            //MySQL_PrivilegioDAO p = new MySQL_PrivilegioDAO();
            
            Docente d = (Docente) session.getAttribute("sesion"); 
            if(d == null){
                response.sendRedirect("error.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Docentes</title>
    </head>
    <body>
        
        <h1><%out.print("Hola! " + d.getNombre());%></h1>
        <%
            out.println("RutT: " + d.getRut());
            out.println("<a href='../cerrarSesion.do'>Cerrar Sesión</a>");
        %>
    </body>
</html>
