<%-- 
    Document   : menuDocenteMensaje
    Created on : 15-05-2018, 6:55:14
    Author     : nloyola
--%>

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
        <title>Enviar Mensaje</title>
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
            <a id="registrarAlum" href='menuDocente.jsp'>Menú Docente</a>
            <br>
            <br>            
        </div>

        <h1 id="titulo4">Enviar Mensaje</h1>

        <%
            //String asignaturaId = request.getParameter("asignatura");
            //int asignaturaID = Integer.parseInt(asignaturaId);
        %>

    </body>
</html>
