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
        <title>Menu Administrador</title>
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
    </body>
</html>
