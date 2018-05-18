<%@page import="model.AlumnoNota"%>
<%@page import="model.Asignatura"%>
<%@page import="factories.MySQL_AsignaturaDAO"%>
<%@page import="java.util.List"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="model.Alumno"%>
<%@page import="model.Nota"%>
<%@page import="factories.MySQL_NotaDAO"%>


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
        <title>Nota Alumno</title>
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
        <h1 id="titulo2">Sus Calificaciones</h1>

        <div id="tblVerNotas">
            <%
                int alumnoAsignaturaNotaId = Integer.parseInt(request.getParameter("alumnoNotaId"));
                MySQL_NotaDAO nota = new MySQL_NotaDAO();
                MySQL_AsignaturaDAO asignatura = new MySQL_AsignaturaDAO();
                out.println("<table id='tablaAlumno2'>");
                out.println("<tr class='teerre'>");
                out.println("<th><h1 class='enunciado2'>Ramo</h1></th>");
                for (int numNota = 1; numNota <= 10; numNota++) {
                    out.println("<th><h1 class='enunciado2'>Nota N° " + numNota + "</h1></th>");
                }
                out.println("</tr>");

                for (Asignatura asig : asignatura.getAsignaturaByAlumno(a.getRut())) {
                    out.println("<tr class='teerre'>");
                    //out.println("<td>" + asig.getNombre() + "</td>");
                    out.println("<td><h1 id='asignaturaVerNota'>" + asig.getNombre() + "</h1></td>");
                    for (Nota n : nota.getNotas(asig.getId())) {
                        //out.println("<td>" + n.getValor() + " (" + n.getPorcentaje() + "%)</td>");
                        out.println("<td><h1 id='alumNota'>" + n.getValor() + "</h1><h1 id='alumNotaPor'>(" + n.getPorcentaje() + "%)</h1></td>");
                    }
                    out.println("</tr>");
                }
                out.println("</table>");


            %>
        </div>
    </body>
</html>

