<%@page import="java.util.List"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="model.Alumno"%>
<%@page import="model.Nota"%>
<%@page import="factories.MySQL_NotaDAO"%>


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
        <title>Nota Alumno</title>
    </head>
    <body>
        <h1>Notas Alumno: <%out.print(a.getNombre() + " " + a.getApellido()); %></h1>

        <%
            int alumnoAsignaturaNotaId = Integer.parseInt(request.getParameter("alumnoNotaId"));

            MySQL_NotaDAO aln = new MySQL_NotaDAO();
            
            out.println("<table border = '1'>");
            out.println("<tr>");
            out.println("<th>Nota</th>");
            out.println("<th>Porcentaje</th>");
            out.println("</tr>");
            out.println(alumnoAsignaturaNotaId);

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

