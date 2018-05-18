<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="model.Alumno"%>
<%@page import="model.Docente"%>
<%@page import="model.Asignatura"%>
<%@page import="model.AlumnoAsignatura"%>
<%@page import="model.MensajeDocente"%>

<%@page import="factories.MySQL_AlumnoDAO"%>
<%@page import="factories.MySQL_DocenteDAO"%>
<%@page import="factories.MySQL_AsignaturaDAO"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="factories.MySQL_MensajeDocenteDAO"%>

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
            //int verMensajeAlumno = Integer.parseInt(request.getParameter("verMensaje"));
            //1.-
            Asignatura nuevoAsignatura = new Asignatura();
            AlumnoAsignatura nuevoAlumnoAsignatura = new AlumnoAsignatura();
            MensajeDocente nuevoMenDocD = new MensajeDocente();
            //2.-
            MySQL_AsignaturaDAO asignaturaD = new MySQL_AsignaturaDAO();
            MySQL_AlumnoAsignaturaDAO alumnoAsignaturaD = new MySQL_AlumnoAsignaturaDAO();
            MySQL_MensajeDocenteDAO mensajeDocenteD = new MySQL_MensajeDocenteDAO();
            //3.-
            nuevoAlumnoAsignatura = alumnoAsignaturaD.getAlumnoByRut(a.getRut());

            out.println("<table border = '1'>");
            out.println("<tr>");
            out.println("<th>Asignatura</th>");
            out.println("<th>Mensaje</th>");
            out.println("</tr>");

            for (MensajeDocente md : mensajeDocenteD.getMensajeDocenteByAlumnoAsignatura(nuevoAlumnoAsignatura.getId())) {
                out.println("<tr>");
                for (Asignatura as : asignaturaD.getAsignaturaBy(nuevoAlumnoAsignatura.getAsignatura_fk())) {
                    out.println("<td>" + as.getNombre() + "</td>");
                    out.println("<td>" + md.getDescripcion() + "</td>");
                }
                out.println("</tr>");

            }
            out.println("</table>");


        %>

    </body>
</html>
