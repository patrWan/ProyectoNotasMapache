<%-- 
    Document   : menuAlumno
    Created on : 30-abr-2018, 21:52:05
    Author     : Patricio
--%>

<%@page import="model.Asignatura"%>
<%@page import="factories.MySQL_asignaturaDAO"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="model.AlumnoAsignatura"%>
<%@page import="factories.MySQL_AlumnosDAO"%>
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
        <h1><%out.println("Bienvenido! " + a.getNombre());%></h1><br>
        <%out.println("Rut: " + a.getRut());%>
        <h2>Asignaturas</h2>
        <%
            MySQL_AlumnosDAO ma = new MySQL_AlumnosDAO();
            MySQL_AlumnoAsignaturaDAO als = new MySQL_AlumnoAsignaturaDAO();
            MySQL_asignaturaDAO asignatura = new MySQL_asignaturaDAO();
            out.println("<table border = '1'>");
                out.println("<tr>");
                    out.println("<th>Asignaturas</th>");
                    out.println("<th>Notas</th>");
                    out.println("<th>Asistencia</th>");
                out.println("</tr>");
            for (AlumnoAsignatura al : als.read()) {
                if (al.getAlumno_fk().equals(a.getRut())) {
                    Asignatura asig = asignatura.getAsignatura(al.getAsignatura_fk());
                    out.println("<tr>");
                        out.println("<th>"+asig.getNombre()+"</th>");
                       out.println("<th><a href='verNotas.jsp?valor="+al.getId()+"'>Ver Notas</a></th>");
                       out.println("<th><a href='menuAlumnoAsistencia.jsp?asignaturaId="+al.getId()+"'>Ver Asistencia</a></th>");
                    out.println("</tr>");
            
                }
            }
            out.println("</table>");
        %>

        <%
            out.println("<br><a href='../cerrarSesion.do'>Cerrar Sesión</a>");
        %>
    </body>
</html>
