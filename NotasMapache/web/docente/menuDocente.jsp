<%@page import="model.Asignatura"%>
<%@page import="factories.MySQL_asignaturaDAO"%>
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
        %>
        
        <%
            MySQL_asignaturaDAO asignatura = new MySQL_asignaturaDAO();
            out.println("<table border = '1'>");
                out.println("<tr>");
                    out.println("<th>Asignatura</th>");
                    out.println("<th>Ingresar Notas</th>");
                    out.println("<th>Ingresar Asistencia</th>");
                out.println("</tr>");
                for(Asignatura a : asignatura.getAsignaturaByDocente(d.getRut())){
                    out.println("<tr>");
                        out.println("<th>"+a.getNombre()+"</th>");
                        out.println("<th><a href='menuIngresarNotas.jsp?asignatura="+a.getId()+"'>Ingresar Notas</a></th>");     
                        out.println("<th><a href='menuIngresarAsistencia.jsp'>Ingresar Asistencia</a></th>"); 
                    out.println("</tr>");
                }
                
            out.println("</table>");
            
            out.println("<br><a href='../cerrarSesion.do'>Cerrar Sesión</a>");
        %>
    </body>
</html>
