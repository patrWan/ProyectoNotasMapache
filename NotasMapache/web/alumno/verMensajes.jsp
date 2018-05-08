<%-- 
    Document   : verMensajes
    Created on : 07-05-2018, 22:44:17
    Author     : Diego
--%>

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
        <title>Mensajes Docente</title>
    </head>
    <body>
        <h1>Mensajes Docente</h1>
        <h1><%out.println("Bienvenido! " + a.getNombre());%></h1><br>
        <%out.println("Rut: " + a.getRut());%>
        <h2>Asignaturas</h2>
        <%
            // MySQL_AlumnosDAO ma = new MySQL_AlumnosDAO();
            // MySQL_AlumnoAsignaturaDAO als = new MySQL_AlumnoAsignaturaDAO();
            // MySQL_asignaturaDAO asignatura = new MySQL_asignaturaDAO();
            out.println("<table border = '1'>");
            out.println("<tr>");
            out.println("<th>Docente</th>");
            out.println("<th>Asignatura</th>");
            out.println("<th>Mensaje</th>");
            out.println("</tr>");
            // for (AlumnoAsignatura al : als.read()) {
                // if (als != null) {
                    // Asignatura asig = asignatura.getAsignatura(al.getAsignatura_fk());
                    out.println("<tr>");
                    out.println("<th></th>");
                    //out.println("<th><a href=''>Ver Notas</a></th>");
                    //out.println("<th><a href=''>Ver Asistencia</a></th>");
                    out.println("</tr>");
                    out.println("</table>");
                //}
            //}
        %>
    </body>
</html>
