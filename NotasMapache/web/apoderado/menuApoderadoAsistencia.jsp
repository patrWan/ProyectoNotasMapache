<%@page import="model.Alumno"%>
<%@page import="model.Asignatura"%>
<%@page import="model.AlumnoAsignatura"%>
<%@page import="factories.MySQL_AsignaturaDAO"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="factories.MySQL_AlumnoDAO"%>
<%@page import="model.Apoderado"%>
<%@page import="model.Asistencia"%>
<%@page import="factories.MySQL_AsistenciaDAO"%>
<%@page import="model.AlumnoAsistencia"%>
<%@page import="factories.MySQL_AlumnoAsistenciaDAO"%>
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
        <title>Asistencia Alumno</title>
    </head>
    <body>
        <% String alumno = request.getParameter("alumno"); %>
        <h1>Asistencia Del Alumno: <% out.println(alumno); %></h1>
        
        
                 <h2 id="titulo1">Mis Asignaturas</h2>
        <%
            MySQL_AlumnoDAO ma = new MySQL_AlumnoDAO();
            MySQL_AlumnoAsignaturaDAO als = new MySQL_AlumnoAsignaturaDAO();
            MySQL_AsignaturaDAO asignatura = new MySQL_AsignaturaDAO();
            Alumno nuevo = new Alumno();
            nuevo=ma.getAlumnoByApoderado(a.getRut());
            out.println("<table id='tablaAlumno'>");
            out.println("<tr class='teerre'>");
            out.println("<th><h1 class='enunciado'>Ramos</h1></th>");
            out.println("<th><h1 class='enunciado'>Notas</h1></th>");
            out.println("<th><h1 class='enunciado'>Asistencia</h1></th>");
            out.println("</tr>");
            
            for (AlumnoAsignatura al : als.read()) {
                if (al.getAlumno_fk().equals(nuevo.getRut())) {
                    Asignatura asig = asignatura.getAsignatura(al.getAsignatura_fk());
                    out.println("<tr  class='teerre'>");
                    //out.println("<th>" + asig.getNombre() + "</th>");
                    out.println("<th><h1 id='asignatura'>" + asig.getNombre() + "</h1></th>");
                    out.println("<th><a  id='verNotajspAlu' href='menuAlumnoNota.jsp?alumnoNotaId=" + al.getId() + "'>Ver Notas</a></th>");
                    out.println("<th><a  id='verAsisjspAlu' href='menuAlumnoAsistencia.jsp?asignaturaId=" + al.getId() + "'>Ver Asistencia</a></th>");
                    out.println("</tr>");

                }
            }
            out.println("</table>");
        %>
        
        
    </body>
</html>
