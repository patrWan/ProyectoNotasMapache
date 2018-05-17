<%@page import="model.Asignatura"%>
<%@page import="factories.MySQL_AsignaturaDAO"%>
<%@page import="factories.MySQL_PrivilegioDAO"%>
<%@page import="model.Docente"%>
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

            Docente d = (Docente) session.getAttribute("sesion");
            if (d == null) {
                response.sendRedirect("error.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Docentes</title>
    </head>
    <body>
        <div class="barraMenuArriba">

            <img class="imgLogo" src="../images/logoIntranet.png">


            <h1 id="ma_nomAlumno"><%out.println("Bienvenid@ : " + d.getNombre());%></h1><br>
            <h1 id="ma_rutAlumno"><%out.println("Rut : " + d.getRut());%></h1>


            <form id="formCerrarSesion" method="POST" action="../cerrarSesion.do">
                <input class="btnCerrarSesion" type="submit" value="Cerrar Sesión">                
            </form>
        </div>
        <div class="barraMenuAbajo">
            <br>
            <br>
            <br>
        </div>



        <%
            MySQL_AsignaturaDAO asignatura = new MySQL_AsignaturaDAO();
            out.println("<table id='tablaAlumno'>");
            out.println("<tr class='teerre'>");
            out.println("<th><h1 class='enunciado'>Ramos Impartidos</h1></th>");
            out.println("<th><h1 class='enunciado'>Ingresar Notas</h1></th>");
            out.println("<th><h1 class='enunciado'>Ingresar Asistencia</h1></th>");
            out.println("<th><h1 class='enunciado'>Enviar Mensaje</h1></th>");
            out.println("</tr>");
            for (Asignatura a : asignatura.getAsignaturaByDocente(d.getRut())) {
                out.println("<tr class='teerre'>");
                //out.println("<th>" + a.getNombre() + "</th>");
                out.println("<th><h1 id='asignatura'>" + a.getNombre() + "</h1></th>");
                out.println("<th><a  id='jspIngresarNota'  href='menuIngresarNotas.jsp?asignatura=" + a.getId() + "'>Ingresar Notas</a></th>");
                out.println("<th><a  id='jspIngresarAsis'  href='menuIngresarAsistencia.jsp'>Ingresar Asistencia</a></th>");
                out.println("<th><a  id='jspEnviarMensaje'  href='menuDocenteMensaje.jsp?idDocente= " + a.getId() + "'>Mensaje Curso</a></th>");
                out.println("</tr>");
            }

            out.println("</table>");
        %>
    </body>
</html>
