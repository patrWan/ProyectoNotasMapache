<%-- 
    Document   : registrarAlumno
    Created on : 06-may-2018, 16:28:50
    Author     : Patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link
            rel = "stylesheet"
            href = "../css/styles.css"
            type = "text/css"
            >

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Alumno</title>
    </head>
    <body>
        <div class="barraMenuArriba">

            <img class="imgLogo" src="../images/logoIntranet.png">


            <h1 id="ma_nomAlumno">Administrador</h1><br>


            <form id="formCerrarSesion" method="POST" action="../index.jsp">
                <input class="btnCerrarSesion" type="submit" value="Volver">                
            </form>
        </div>

        <div id="barraMenuAbajoId">
            <a id="registrarAlum" href='registrarAlumno.jsp'>Registrar Alumno</a>
            <a id="registrarDoc" href='registrarDocente.jsp'>Registrar Docente</a>
        </div>
        
        <h1 id="titulo3" >Registro alumno</h1>

        <form method="POST" action="../registrarAlumno.do">
            <h4 id="subtitulo1" >Datos Apoderado</h4> <h4 id="subtitulo2" >Datos Alumno</h4>
            
            <div id="divDatosApo">                
                <input class="txtApo" type="text" name="txtRutApoderado" placeholder="Ingrese Rut:" required=""><br>
                <input class="txtApo"  type="text" name="txtNombreApoderado" placeholder="Ingrese Nombre:" required=""><br>
                <input class="txtApo"  type="text" name="txtApellidoApoderado" placeholder="Ingrese Apellido:" required=""><br>
                <input class="txtApo"  type="password" name="txtPassApoderado" placeholder="Ingrese Contraseña:" required="">
            </div>

            <div id="divDatosAlum">                
                <input id="txtRegRutAlu"  type="text" name="txtRutAlumno" placeholder="Ingrese Rut:" required=""><br>
                <input id="txtRegNomAlu"  type="text" name="txtNombreAlumno" placeholder="Ingrese Nombre:" required="">
                <input id="txtRegApeAlu"  type="text" name="txtApellidoAlumno" placeholder="Ingrese Apellido:" required=""><br>
                <input id="txtRegDirecAlu"  type="text" name="txtDireccionAlumno" placeholder="Ingrese Direccion:" required=""><br>
                <input id="txtRegPassAlu"  type="password" name="txtPassAlumno" placeholder="Ingrese Contraseña:" required=""><br>

                <input id="btnRegistrarAlumno" type="submit" value="Registrar Alumno">
            </div>
        </form>
    </body>
</html>
