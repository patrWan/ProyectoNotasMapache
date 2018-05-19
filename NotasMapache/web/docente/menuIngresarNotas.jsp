<%-- 
    Document   : menuIngresarNotas
    Created on : 13-may-2018, 19:49:15
    Author     : Patricio
--%>

<%@page import="model.AlumnoAsignaturaId"%>
<%@page import="model.AlumnoAsignatura"%>
<%@page import="factories.MySQL_AlumnoAsignaturaDAO"%>
<%@page import="factories.MySQL_AlumnoDAO"%>
<%@page import="model.Alumno"%>
<%@page import="model.AlumnoNota"%>
<%@page import="factories.MySQL_NotaDAO"%>
<%@page import="model.Asignatura"%>
<%@page import="factories.MySQL_AsignaturaDAO"%>
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
        <title>Menu Notas</title>
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


        <h1 id="titulo4">Ingreso de Notas</h1>


        <% out.println("<h1 id='titulo5'>Seleccione Alumno : </h1>"); %>

        <%
            String asignaturaId = request.getParameter("asignatura");
            int asignaturaID = Integer.parseInt(asignaturaId);
            MySQL_NotaDAO nota = new MySQL_NotaDAO();
            MySQL_AlumnoDAO alumno = new MySQL_AlumnoDAO();
            MySQL_AlumnoAsignaturaDAO alumnoAsig = new MySQL_AlumnoAsignaturaDAO();

            out.println("<div id='cboAs'>");
            out.println("<form method='POST' action='../ingresarNota.do?asignatura=" + asignaturaId + "'>");

            out.println("<select id='cboSelectAlumno' name='cboAlumno'>");
            for (AlumnoAsignaturaId ann : alumnoAsig.getListAlumnosAsignaturaId(asignaturaId)) {
                out.println("<option value='" + ann.getIdAlumnoAsignatura() + "'>" + ann.getNombre() + " " + ann.getApellido() + "</option>");
            }
            out.println("</select><br>");
            
            out.println("<br>");
            
            out.println("<input id='regValorNota' type='number' name='txtNota' placeholder='Nota : ' required='' step='0.1' min='1.0' max='7.0'>");
            out.println("<input id='regPorNota'  type='number' name='txtPorcentaje' placeholder='% : ' required='' step='0.1' min='1.0' max='100.0'>");
            out.println("<input id='btnIngresarNota' type='submit' value='Ingresar Nota'>");
            out.println("</form>");
            out.println("</div>");
            
            out.println("<br>");
            out.println("<br>");
            

            out.println("<table id='tablaAlumno2'>");
            out.println("<tr class='teerre'>");
            out.println("<th><h1 class='enunciado2'>Nombre</h1></th>");
            for (int numNota = 1; numNota <= 10; numNota++) {
                out.println("<th><h1 class='enunciado2'>Nota N° " + numNota + "</h1></th>");
            }
            out.println("</tr>");
            if (request.getParameter("modificar") == null) {
                for (Alumno ann : alumno.getAlumnoByAsignatura(asignaturaId)) {
                    out.println("<tr class='teerre'>");
                    //out.println("<td>" + ann.getNombre() + "</td>");
                    out.println("<td><h1 id='asignaturaVerNota'>" + ann.getNombre() + "</h1></td>");
                    for (AlumnoNota an : nota.getNotasbyAsignatura(ann.getRut(), asignaturaID)) {
                       //out.println("<td>" + an.getValor() + " (" + an.getPorcentaje() + "%)</td>");
                       out.println("<td><h1 id='alumNota'>" + an.getValor() + "</h1><h1 id='alumNotaPor'>(" + an.getPorcentaje() + "%)</h1></td>");
                    }
                    out.println("</tr>");
                }
                out.println("</table>");
            } else {
                for (Alumno ann : alumno.getAlumnoByAsignatura(asignaturaId)) {
                    out.println("<tr class='teerre'>");
                    out.println("<td><h1 id='asignaturaVerNota'>" + ann.getNombre() + "</h1></td>");
                    for (AlumnoNota an : nota.getNotasbyAsignatura(ann.getRut(), asignaturaID)) {
                       out.println("<td><h1 id='alumNota'>" + an.getValor() + "</h1><h1 id='alumNotaPor'>(" + an.getPorcentaje() + "%)</h1></td>");
                    }
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        %>


        <%
        out.println("<br>");
        out.println("<br>");
        
        if (request.getParameter("modificar")== null) {
        out.println("<a id='modificarNota' href='menuIngresarNotas.jsp?asignatura=" + asignaturaId + "&modificar=si'>Modificar nota</a>");
        }
        if (request.getParameter("modificar")!= null) {
          out.println("<form method='POST' action='../modificarNota.do?asignatura="+asignaturaId+"'>");
            out.println("<input id='idNotaModi' type='number' name='txtId' placeholder='ID Nota: ' required=''>");
            out.println("<input id='nuevaNota' type='number' name='txtNotaNueva' placeholder='Nota: ' required='' step='0.1' min='1.0' max='7.0'>");
            out.println("<input id='btnModificarNota' type='submit' value='Modificar Nota'>");
          out.println("</form>");
        }
        %>

    </body>
</html>
