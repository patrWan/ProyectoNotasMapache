<%-- 
    Document   : certificadoAlumnoRegularAlum
    Created on : 18-05-2018, 23:50:07
    Author     : Diego
--%>

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
        <title>Certificado Alumno Regular</title>
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
            <br>
            <a id="registrarAlum" href='menuAlumno.jsp'>Menú</a>
            <a id="registrarDoc" href='verMensajes.jsp'>Ver Mensajes Docente</a> 
            <br>
            <br>
        </div>
            <br>
            <br>
            <br>

        <form class="generarpdf" action="../generarPDF.do" method="POST">
            <%
                out.println("<input type='hidden' value='" + a.getRut() + "' name='txtRut'>");
                out.println("<input type='hidden' value='" + a.getNombre() + "' name='txtNombre'>");
                out.println("<input type='hidden' value='" + a.getApellido() + "' name='txtApe'>");
                out.println("<input class='btnGenerarPDF' type='submit' value='Generar PDF'>");
            %>

        </form>
    </body>


</html>
