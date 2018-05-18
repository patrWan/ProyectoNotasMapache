<%-- 
    Document   : MenuAlumnoAsistenciaPadre
    Created on : 17-may-2018, 13:45:18
    Author     : luisp
--%>

<%@page import="model.Apoderado"%>
<%@page import="factories.MySQL_AlumnoDAO"%>
<%@page import="model.Alumno"%>
<%@page import="model.Asistencia"%>
<%@page import="model.AlumnoAsistencia"%>
<%@page import="factories.MySQL_AsistenciaDAO"%>
<%@page import="factories.MySQL_AlumnoAsistenciaDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link
            rel = "stylesheet"
            href = "../css/styles.css"
            type = "text/css"
            >
        <%
            //MySQL_PrivilegioDAO p = new MySQL_PrivilegioDAO();

            Apoderado a = (Apoderado) session.getAttribute("sesion");
            if (a == null) {
                response.sendRedirect("error.jsp");
            }

        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="barraMenuArriba">
            <%   Alumno nuevo = new Alumno();
                MySQL_AlumnoDAO ma = new MySQL_AlumnoDAO();
                nuevo = ma.getAlumnoByApoderado(a.getRut());
            %>

            <img class="imgLogo" src="../images/logoIntranet.png">


            <h1 id="ma_nomAlumno"><%out.println("Bienvenid@ : " + a.getNombre());%></h1><br>
            <h1 id="ma_rutAlumno"><%out.println("Rut : " + a.getRut());%></h1>

            <form id="formCerrarSesion" method="POST" action="../cerrarSesion.do">
                <input class="btnCerrarSesion" type="submit" value="Cerrar Sesión">                
            </form>
        </div>

        <div class="barraMenuAbajo">
            <br>
            <br>
            <br>
        </div>

        <h2 id="titulo1"><%out.println("Asistencia de  : " + nuevo.getNombre());%></h2>

        <%
            int alumnoAsignatura = Integer.parseInt(request.getParameter("asignaturaId"));
            MySQL_AlumnoAsistenciaDAO aa = new MySQL_AlumnoAsistenciaDAO();
            MySQL_AsistenciaDAO asistenciaAlumno = new MySQL_AsistenciaDAO();

            out.println("<table id='tablaAlumno3'>");
            out.println("<tr>");
            out.println("<th><h1 class='enunciado3'>Día / Hora</h1></th>");
            out.println("<th><h1 class='enunciado3'>Asistido</h1></th>");
            out.println("</tr>");

            for (AlumnoAsistencia as : aa.getAlumnoAsistencia(alumnoAsignatura)) {
                out.println("<tr>");
                Asistencia asistencia = asistenciaAlumno.getAsistencia(as.getAsistencia_fk());
                //out.println("<th>" + asistencia.getFechaHora() + "</th>");
                out.println("<th class='thAsistenciaAlum' ><h1 id='asignaturaVerNota'>" + asistencia.getFechaHora() + "</h1></th>");
                if (as.isAsistido() == true) {
                    out.println("<th class='thAsistenciaAlum' ><div id='siAsistio'></div></th>");
                } else {
                    out.println("<th class='thAsistenciaAlum' ><div id='noAsistio'></div></th>");
                }
                out.println("</tr>");
            }

            out.println("</table>");

        %>
    </body>
</html>
