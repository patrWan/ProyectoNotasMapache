<%-- 
    Document   : certificadoAlumnoRegularApo
    Created on : 18-05-2018, 23:50:24
    Author     : Diego
--%>

<%@page import="factories.MySQL_AlumnoDAO"%>
<%@page import="model.Alumno"%>
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
            <%                Alumno nuevo = new Alumno();
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
            <a id="registrarAlum" href='registrarAlumno.jsp'>Certificado Alumno Regular</a>
            <br>
            <br>
        </div>

        <br>
        <br>
        <br>


        <form action="../generarPDF.do" method="POST">
            <%
                out.println("<input type='hidden' value='" + nuevo.getRut() + "' name='txtRut'>");
                out.println("<input type='hidden' value='" + nuevo.getNombre() + "' name='txtNombre'>");
                out.println("<input type='hidden' value='" + nuevo.getApellido() + "' name='txtApe'>");
                out.println("<input class='btnGenerarPDF' type='submit' value='Generar PDF'>");
            %>

        </form>
    </body>
</html>
