<%-- 
    Document   : MenuAlumnoAsistenciaPadre
    Created on : 17-may-2018, 13:45:18
    Author     : luisp
--%>

<%@page import="model.Alumno"%>
<%@page import="model.Asistencia"%>
<%@page import="model.AlumnoAsistencia"%>
<%@page import="factories.MySQL_AsistenciaDAO"%>
<%@page import="factories.MySQL_AlumnoAsistenciaDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        int alumnoAsignatura = Integer.parseInt(request.getParameter("asignaturaId"));
        MySQL_AlumnoAsistenciaDAO aa = new MySQL_AlumnoAsistenciaDAO();
        MySQL_AsistenciaDAO asistenciaAlumno = new MySQL_AsistenciaDAO();
        
        out.println("<table border = '1'>");
            out.println("<tr>");
                out.println("<th>Dia/Hora</th>");
                out.println("<th>Asistido</th>");
            out.println("</tr>");
            
                for(AlumnoAsistencia as : aa.getAlumnoAsistencia(alumnoAsignatura)){
                    out.println("<tr>");
                    Asistencia asistencia = asistenciaAlumno.getAsistencia(as.getAsistencia_fk());
                    out.println("<th>"+asistencia.getFechaHora()+"</th>");
                    if (as.isAsistido() == true) {
                       out.println("<th bgcolor='green'></th>");     
                    }else{
                        out.println("<th bgcolor='red'></th>"); 
                    }
                    out.println("</tr>");
                }
            
        out.println("</table>");
        
        %>
    </body>
</html>
