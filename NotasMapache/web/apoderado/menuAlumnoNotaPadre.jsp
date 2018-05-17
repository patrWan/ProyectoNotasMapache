<%-- 
    Document   : menuAlumnoNotaPadre
    Created on : 17-may-2018, 13:44:45
    Author     : luisp
--%>

<%@page import="model.Nota"%>
<%@page import="factories.MySQL_NotaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
            int alumnoAsignaturaNotaId = Integer.parseInt(request.getParameter("alumnoNotaId"));

            MySQL_NotaDAO aln = new MySQL_NotaDAO();
            
            out.println("<table border = '1'>");
            out.println("<tr>");
            out.println("<th>Nota</th>");
            out.println("<th>Porcentaje</th>");
            out.println("</tr>");
           

            for (Nota n  : aln.getNotas(alumnoAsignaturaNotaId)) {
                out.println("<tr>");
                
                out.println("<th>" + n.getValor()+ "</th>");
                out.println("<th>" + n.getPorcentaje()+ "</th>");

                out.println("</tr>");
            }

            out.println("</table>");


        %>
    </body>
</html>
