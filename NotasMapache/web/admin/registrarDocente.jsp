<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            rel = "stylesheet"
            href = "../css/styles.css"
            type = "text/css"
            >
        <title>Registrar Docente</title>
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

        <h1 id="titulo2" >Registro Docente</h1>
        <form id="formRegDocente" method="POST" action="../registrarDocente.do">
            <input id="txtRegRutDo" type="text" name="txtRut" placeholder="Ingrese Rut:" required=""><br>
            <input id="txtRegNomDo" type="text" name="txtNombre" placeholder="Ingrese Nombre:" required="">
            <input id="txtRegApeDo" type="text" name="txtApellido" placeholder="Ingrese Apellido:" required=""><br>
            <input id="txtRegDirecDo" type="text" name="txtDireccion" placeholder="Ingrese Direccion:" required=""><br>
            <input id="txtRegCoDo" type="email" name="txtCorreo" placeholder="Ingrese Correo:" required=""><br>
            <input id="txtRegUserDo" type="text" name="txtUsuario" placeholder="Ingrese Usuario:" required="">
            <input id="txtRegPassDo" type="password" name="txtPass" placeholder="Ingrese Contraseña:" required=""><br>
            <input id="btnRegistrarDocente" type="submit" value="Registrar Docente">
        </form>
    </body>
</html>
