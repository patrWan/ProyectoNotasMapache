<%@page import="model.AlumnoAsignatura"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="model.Asignatura"%>
<%@page import="model.Alumno"%>
<%@page import="factories.MySQL_AsignaturaDAO"%>
<%@page import="factories.MySQL_AlumnoDAO"%>
<%@page import="factories.MySQL_AlumnoDAO"%>
<%@page import="model.Apoderado"%>
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
        <title>Menu Apoderados</title>
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
            <a id="registrarAlum" href='certificadoAlumnoRegularApo.jsp'>Certificado Alumno Regular</a>
            <br>
            <br>
        </div>

        <h2 id="titulo1"><%out.println("Asignaturas de  : " + nuevo.getNombre());%></h2>
        <%

            MySQL_AlumnoAsignaturaDAO als = new MySQL_AlumnoAsignaturaDAO();
            MySQL_AsignaturaDAO asignatura = new MySQL_AsignaturaDAO();

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
                    out.println("<th><a  id='verNotajspAlu' href='menuAlumnoNotaPadre.jsp?alumnoNotaId=" + al.getId() + "'>Ver Notas</a></th>");
                    out.println("<th><a  id='verAsisjspAlu' href='menuAlumnoAsistenciaPadre.jsp?asignaturaId=" + al.getId() + "'>Ver Asistencia</a></th>");
                    out.println("</tr>");

                }
            }
            out.println("</table>");
        %>


    </body>

</html>
