<%-- 
    Document   : selectAsignaturaApoderado
    Created on : 07-05-2018, 22:50:09
    Author     : Diego
--%>

<%@page import="model.Alumno"%>
<%@page import="factories.MySQL_ApoderadoDAO"%>
<%@page import="model.Asignatura"%>
<%@page import="model.Asignatura"%>
<%@page import="model.AlumnoAsignatura"%>
<%@page import="factories.MySQL_asignaturaDAO"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="factories.MySQL_AlumnosDAO"%>
<%@page import="model.Apoderado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //MySQL_PrivilegioDAO p = new MySQL_PrivilegioDAO();

            Apoderado a = (Apoderado) session.getAttribute("sesion");
            if (a == null) {
                response.sendRedirect("error.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccionar Asignatura</title>
    </head>
    <body>
        <h1>Notas y Asistencia segun Asignatura</h1>
        
        <%
            MySQL_AlumnosDAO alum = new MySQL_AlumnosDAO();
            Alumno alumno = alum.getAlumnoByApoderado(a.getRut());   
            
            
            MySQL_AlumnoAsignaturaDAO als = new MySQL_AlumnoAsignaturaDAO();
            MySQL_asignaturaDAO asignatura = new MySQL_asignaturaDAO();
            
            
            out.println("<table border = '1'>");
            out.println("<tr>");
            out.println("<th>Asignaturas</th>");
            out.println("<th>Alumno</th>");
            out.println("<th>Notas</th>");
            out.println("<th>Asistencia</th>");
            out.println("</tr>");
            for (AlumnoAsignatura al : als.getListAlumnos(alumno.getRut())) {
                if (als != null) {
                    Asignatura asig = asignatura.getAsignatura(al.getAsignatura_fk());
                    out.println("<tr>");
                    out.println("<th>" + asig.getNombre() + "</th>");
                    //out.println("<th><a href=''>Ver Notas</a></th>");
                    out.println("<th><a href='menuApoderadoAsistencia.jsp?asignaturaId="+al.getId()+"&alumno="+alumno.getNombre()+"'>Ver Asistencia</a></th>");
                    out.println("</tr>");
                    
                }
            }
            out.println("</table>");
        %>

    </body>
</html>
