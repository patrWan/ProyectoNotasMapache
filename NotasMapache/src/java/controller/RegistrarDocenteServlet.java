package controller;

import dao.ConexionDAO;
import factories.MySQL_CuentaDAO;
import factories.MySQL_DocenteDAO;
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
import model.Cuenta;
import model.Docente;

@WebServlet(name = "RegistrarDocenteServlet", urlPatterns = {"/registrarDocente.do"})
public class RegistrarDocenteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            MySQL_CuentaDAO daoC = new MySQL_CuentaDAO();
            MySQL_DocenteDAO daoD = new MySQL_DocenteDAO();
            String rut, nombre, apellido, direccion, correo, usuario, pass;
            
            rut = request.getParameter("txtRut");
            nombre = request.getParameter("txtNombre");
            apellido = request.getParameter("txtApellido");
            direccion = request.getParameter("txtDireccion");
            correo = request.getParameter("txtCorreo");
            usuario = request.getParameter("txtUsuario");
            pass = request.getParameter("txtPass");
            
            Cuenta nueva = new Cuenta();
            nueva.setId(daoC.listaCuentas().size()+1);
            nueva.setUsuario(usuario);
            nueva.setPass(pass);
            nueva.setPrivilegio(2);
            
            daoC.crearCuenta(nueva);
            
            Docente d = new Docente();
            d.setRut(rut);
            d.setNombre(nombre);
            d.setApellido(apellido);
            d.setDireccion(direccion);
            d.setCorreo(correo);
            
            daoD.create(d, nueva);
            
            response.sendRedirect("admin/registrarDocente.jsp");
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarDocenteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarDocenteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
