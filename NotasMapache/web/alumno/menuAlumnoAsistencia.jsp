<%@page import="model.Asistencia"%>
<%@page import="factories.MySQL_AsistenciaDAO"%>
<%@page import="model.AlumnoAsistencia"%>
<%@page import="factories.MySQL_AlumnoAsistenciaDAO"%>
<%@page import="model.Alumno"%>
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
            Alumno a = (Alumno) session.getAttribute("sesion");
            if (a == null) {
                response.sendRedirect("error.jsp");
            }

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asistencia Alumno</title>
    </head>
    <body>
        <div class="barraMenuArriba">

            <img class="imgLogo" src="../images/logoIntranet.png">


            <h1 id="ma_nomAlumno"><%out.println("Bienvenid@ : " + a.getNombre());%></h1><br>
            <h1 id="ma_rutAlumno"><%out.println("Rut : " + a.getRut());%></h1>


            <form id="formCerrarSesion" method="POST" action="../cerrarSesion.do">
                <input class="btnCerrarSesion" type="submit" value="Cerrar Sesión">                
            </form>
        </div>

        <div id="barraMenuAbajoId">
            <a id="registrarAlum" href='menuAlumno.jsp'>Menú</a>
            <a id="registrarDoc" href='verMensajes.jsp'>Ver Mensajes Docente</a>
        </div>
        <h1 id="titulo2">Asistencia</h1>

        <div id="divAsisJspAlum">
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
        </div>
    </body>
</html>
