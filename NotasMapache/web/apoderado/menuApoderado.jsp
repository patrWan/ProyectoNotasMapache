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

            <img class="imgLogo" src="../images/logoIntranet.png">


            <h1 id="ma_nomAlumno"><%out.println("Bienvenid@ : " + a.getNombre());%></h1><br>
            <h1 id="ma_rutAlumno"><%out.println("Rut : " + a.getRut());%></h1>


            <form id="formCerrarSesion" method="POST" action="../cerrarSesion.do">
                <input class="btnCerrarSesion" type="submit" value="Cerrar Sesión">                
            </form>
        </div>

        <div class="barraMenuAbajo">
            <form action="selectAsignaturaApoderado.jsp">
                <%
                    out.println("<button id='verMensaje' type='submit' >Ver Notas y Asistencia</button>");
                %>
            </form>
        </div>
    </body>
</html>
