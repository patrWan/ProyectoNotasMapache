<%@page import="model.AlumnoNota"%>
<%@page import="model.Asignatura"%>
<%@page import="factories.MySQL_AsignaturaDAO"%>
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
            MySQL_NotaDAO nota = new MySQL_NotaDAO();
            MySQL_AsignaturaDAO asignatura = new MySQL_AsignaturaDAO();
            out.println("<table border = '1'>");
            out.println("<tr>");
            out.println("<th>Nombre</th>");
            for (int numNota = 1; numNota <= 10; numNota++) {
                out.println("<th>Nota N° " + numNota + "</th>");
            }
            out.println("</tr>");

            for (Asignatura asig : asignatura.getAsignaturaByAlumno(a.getRut())) {
                out.println("<tr>");
                out.println("<td>" + asig.getNombre() + "</td>");
                for (Nota n : nota.getNotas(asig.getId())) {
                    out.println("<td>" + n.getValor() + " (" + n.getPorcentaje() + "%)</td>");
                }
                out.println("</tr>");
            }
            out.println("</table>");


        %>
    </body>
</html>

