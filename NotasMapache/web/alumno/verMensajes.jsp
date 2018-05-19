<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        <title>Mensajes Docente</title>
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
        </div>

        <h1 id="titulo3">Mensajes</h1>

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

            // aca tenemos la lista de id de alumnoAsignatura
            List<AlumnoAsignatura> alumnoAsigList = alumnoAsignaturaD.getListAlumnos(a.getRut());

            //obtenemos la lista de mensajes segun la lista de asignaturas
            //List<MensajeDocente> mensajeDocenteList = new ArrayList<>();
            //for (AlumnoAsignatura alumAs : alumnoAsignaturaList) {
            //  out.println("<h1>" + alumAs.getId() + "</h1>");
            //}
            out.println("<table id='tablaAlumno3'>");
            out.println("<tr class='teerre'>");
            out.println("<th><h1 class='enunciado3'>Asignatura</h1></th>");
            out.println("<th><h1 class='enunciado3'>Mensaje</h1></th>");
            out.println("</tr>");

            for (AlumnoAsignatura alumAs : alumnoAsigList) {
                out.println("<tr class='teerre'>");
                for (MensajeDocente md : mensajeDocenteD.getMensajeDocenteByAlumnoAsignatura(alumAs.getAsignatura_fk())) {
                    for (Asignatura as : asignaturaD.getAsignaturaBy(nuevoAlumnoAsignatura.getAsignatura_fk())) {
                        //out.println("<td>" + as.getNombre() + "</td>");
                        out.println("<td><h1 id='mensage'>" + as.getNombre() + "</h1></td>");
                        //out.println("<td>" + md.getDescripcion() + "</td>");
                        out.println("<td><h1 id='mensage'>" + md.getDescripcion() + "</h1></td>");
                    }
                    out.println("</tr>");
                }
            }
            /*for (MensajeDocente md : mensajeDocenteD.getMensajeDocenteByAlumnoAsignatura(nuevoAlumnoAsignatura.getId())) {
                out.println("<tr class='teerre'>");
                for (Asignatura as : asignaturaD.getAsignaturaBy(nuevoAlumnoAsignatura.getAsignatura_fk())) {
                    //out.println("<td>" + as.getNombre() + "</td>");
                    out.println("<td><h1 id='mensage'>" + as.getNombre() + "</h1></td>");
                    //out.println("<td>" + md.getDescripcion() + "</td>");
                    out.println("<td><h1 id='mensage'>" + md.getDescripcion() + "</h1></td>");
                }

                out.println("</tr>");

            }*/

            out.println("</table>");


        %>

    </body>
</html>
