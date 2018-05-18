<%-- 
    Document   : menuAlumnoNotaPadre
    Created on : 17-may-2018, 13:44:45
    Author     : luisp
--%>

<%@page import="model.Asignatura"%>
<%@page import="factories.MySQL_AsignaturaDAO"%>
<%@page import="model.Apoderado"%>
<%@page import="factories.MySQL_AlumnoDAO"%>
<%@page import="model.Alumno"%>
<%@page import="model.Nota"%>
<%@page import="factories.MySQL_NotaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notas Pupilo</title>

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
    </head>
    <body>
        <div class="barraMenuArriba">
            <%   Alumno nuevo = new Alumno();
                MySQL_AlumnoDAO ma = new MySQL_AlumnoDAO();
                nuevo = ma.getAlumnoByApoderado(a.getRut());
                
                Asignatura asignatura = new Asignatura();
                MySQL_AsignaturaDAO asig = new MySQL_AsignaturaDAO();
                int alumnoAsignaturaNotaId = Integer.parseInt(request.getParameter("alumnoNotaId"));
                asignatura = asig.getAsignatura(alumnoAsignaturaNotaId);
                
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

        <h2 id="tituloUno"><%out.println("Notas de  : ");%></h2>
        <h2 id="tituloDos"><%out.println(nuevo.getNombre());%></h2>
        <h2 id="tituloTres"><%out.println(" De la Asignatura : ");%></h2>
        <h2 id="tituloCuatro"><%out.println(asignatura.getNombre());%></h2>
        <%
            

            MySQL_NotaDAO aln = new MySQL_NotaDAO();

            out.println("<table id='tablaAlumno3'>");
            out.println("<tr class='teerre'>");
            out.println("<th><h1 class='enunciado3'>Nota</h1></th>");
            out.println("<th><h1 class='enunciado3'>Porcentaje</h1></th>");
            out.println("</tr>");

            for (Nota n : aln.getNotas(alumnoAsignaturaNotaId)) {
                out.println("<tr class='teerre'>");

                //out.println("<th>" + n.getValor() + "</th>");
                out.println("<th><h1 id='alumNota'>" + n.getValor() + "</h1></th>");
                //out.println("<th>" + n.getPorcentaje() + "</th>");
                out.println("<th><h1 id='alumNota'>" + n.getPorcentaje() + "%</h1></th>");

                out.println("</tr>");
            }

            out.println("</table>");


        %>
    </body>
</html>
