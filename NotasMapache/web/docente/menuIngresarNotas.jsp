<%-- 
    Document   : menuIngresarNotas
    Created on : 13-may-2018, 19:49:15
    Author     : Patricio
--%>

<%@page import="model.AlumnoAsignaturaId"%>
<%@page import="model.AlumnoAsignatura"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="factories.MySQL_AlumnosDAO"%>
<%@page import="model.Alumno"%>
<%@page import="model.AlumnoNota"%>
<%@page import="factories.MySQL_NotaDAO"%>
<%@page import="model.Asignatura"%>
<%@page import="factories.MySQL_asignaturaDAO"%>
<%@page import="model.Docente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //MySQL_PrivilegioDAO p = new MySQL_PrivilegioDAO();

            Docente d = (Docente) session.getAttribute("sesion");
            if (d == null) {
                response.sendRedirect("error.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Notas</title>
    </head>
    <body>
        <h1>Ingreso de Notas</h1>
        <% out.println("Asignatura: "); %>
        <%
            String asignaturaId = request.getParameter("asignatura");
            MySQL_NotaDAO nota = new MySQL_NotaDAO();
            MySQL_AlumnosDAO alumno = new MySQL_AlumnosDAO();
            MySQL_AlumnoAsignaturaDAO alumnoAsig = new MySQL_AlumnoAsignaturaDAO();
            out.println("<table border = '1'>");
            out.println("<tr>");
            out.println("<th>Nombre</th>");
            for (int numNota = 1; numNota <= 10; numNota++) {
                out.println("<th>Nota N° " + numNota + "</th>");
            }
            out.println("</tr>");
            if (request.getParameter("modificar") == null) {
                for (Alumno ann : alumno.getAlumnoByAsignatura(asignaturaId)) {
                    out.println("<tr>");
                    out.println("<td>" + ann.getNombre() + "</td>");
                    for (AlumnoNota an : nota.getNotasbyAsignatura(ann.getRut())) {
                        out.println("<td>" + an.getValor() + " (" + an.getPorcentaje() + "%)</td>");
                    }
                    out.println("</tr>");
                }
                out.println("</table>");
            }else{
                for (Alumno ann : alumno.getAlumnoByAsignatura(asignaturaId)) {
                    out.println("<tr>");
                    out.println("<td>" + ann.getNombre() + "</td>");
                    for (AlumnoNota an : nota.getNotasbyAsignatura(ann.getRut())) {
                        out.println("<td>" + an.getValor() + " (" + an.getPorcentaje() + "%) <b>ID: "+an.getNotaId()+"</b></td>");
                    }
                    out.println("</tr>");
                }
                out.println("</table>");
            }

        %>
        
        <%
            out.println("<form method='POST' action='../ingresarNota.do?asignatura="+asignaturaId+"'>");
                out.println("<select name='cboAlumno'>");
                for(AlumnoAsignaturaId ann : alumnoAsig.getListAlumnosAsignaturaId(asignaturaId)){
                    out.println("<option value='"+ann.getIdAlumnoAsignatura()+"'>"+ann.getNombre()+" "+ann.getApellido()+"</option>");
                }
                out.println("</select>");
                out.println("<input type='text' name='txtNota' placeholder='Ingrese nota: ' required=''>");
                out.println("<input type='text' name='txtPorcentaje' placeholder='Ingrese porcentaje: ' required=''>");
                out.println("<input type='submit' value='Ingresar Nota'>");
            out.println("</form>");
        %>
        <%
        out.println("<a href='menuIngresarNotas.jsp?asignatura=" + asignaturaId + "&modificar=si'>Modificar nota</a>");
        
        if (request.getParameter("modificar")!= null) {
          out.println("<form method='POST' action='../modificarNota.do?asignatura="+asignaturaId+"'>");
            out.println("<input type='number' name='txtId' placeholder='Ingrese ID de la nota: ' required=''>");
            out.println("<input type='text' name='txtNotaNueva' placeholder='Ingrese nueva nota: ' required=''>");
            out.println("<input type='submit' value='Modificar Nota'>");
          out.println("</form>");
        }
        %>

    </body>
</html>
