package controller;

import factories.MySQL_AlumnosDAO;
import factories.MySQL_ApoderadoDAO;
import factories.MySQL_CuentaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Alumno;
import model.Apoderado;
import model.Cuenta;

@WebServlet(name = "RegistrarAlumnoServlet", urlPatterns = {"/registrarAlumno.do"})
public class RegistrarAlumnoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            MySQL_CuentaDAO daoC = new MySQL_CuentaDAO();
            MySQL_ApoderadoDAO a = new MySQL_ApoderadoDAO();
            MySQL_AlumnosDAO al = new MySQL_AlumnosDAO();
            
            //Cuenta Apoderado
            String userApoderado, passApoderado;
            userApoderado = request.getParameter("txtUsuarioApoderado");
            passApoderado = request.getParameter("txtPassApoderado");
            
            Cuenta apoderado = new Cuenta();
            int idCuenta = daoC.listaCuentas().size() + 1;
            apoderado.setId(idCuenta);
            apoderado.setUsuario(userApoderado);
            apoderado.setPass(passApoderado);
            apoderado.setPrivilegio(3);
            
            daoC.crearCuenta(apoderado);
            
            //Datos Apoderado
            String rutApoderado, nombreApoderado, apellidoApoderado;
            rutApoderado = request.getParameter("txtRutApoderado");
            nombreApoderado = request.getParameter("txtNombreApoderado");
            apellidoApoderado = request.getParameter("txtApellidoApoderado");
            
            Apoderado nuevo = new Apoderado();
            nuevo.setRut(rutApoderado);
            nuevo.setNombre(nombreApoderado);
            nuevo.setApellido(apellidoApoderado);
            nuevo.setCuenta(daoC.listaCuentas().size());
            
            a.create(nuevo);
            
            //Cuenta Alumno
            String usuarioAlumno, passAlumno;
            usuarioAlumno = request.getParameter("txtUsuarioAlumno");
            passAlumno = request.getParameter("txtPassAlumno");
            
            Cuenta alumno = new Cuenta();
            alumno.setId(daoC.listaCuentas().size() + 1);
            alumno.setUsuario(usuarioAlumno);
            alumno.setPass(passAlumno);
            alumno.setPrivilegio(1);
            
            daoC.crearCuenta(alumno);
            
            //Datos Alumno
            String rutAlumno, nombreAlumno, apellidoAlumno, direccionAlumno;
            rutAlumno = request.getParameter("txtRutAlumno");
            nombreAlumno = request.getParameter("txtNombreAlumno");
            apellidoAlumno = request.getParameter("txtApellidoAlumno");
            direccionAlumno = request.getParameter("txtDireccionAlumno");
            
            Alumno nuevoAlumno = new Alumno();
            nuevoAlumno.setRut(rutAlumno);
            nuevoAlumno.setNombre(nombreAlumno);
            nuevoAlumno.setApellido(apellidoAlumno);
            nuevoAlumno.setDireccion(direccionAlumno);
            nuevoAlumno.setCuenta(daoC.listaCuentas().size());
            nuevoAlumno.setApoderado_fk(rutApoderado);
            nuevoAlumno.setAlumnoActivo(true);
            
            al.create(nuevoAlumno);
            
            response.sendRedirect("admin/registrarAlumno.jsp");
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarAlumnoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarAlumnoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
