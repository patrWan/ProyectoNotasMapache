package controller;

import factories.MySQL_AlumnosDAO;
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
import javax.servlet.http.HttpSession;
import model.Alumno;
import model.Cuenta;

/**
 *
 * @author Patricio
 */
@WebServlet(name = "IniciarSesionServlet", urlPatterns = {"/IniciarSesion.do"})
public class IniciarSesionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                //Recibo los datos de Cuenta(Usuario y Pass)
                MySQL_CuentaDAO cuenta = new MySQL_CuentaDAO();
                MySQL_AlumnosDAO a = new MySQL_AlumnosDAO();
                
                String user, pass;
                user = request.getParameter("txtUser");
                pass = request.getParameter("txtPass");
                
                Cuenta c = cuenta.getCuenta(user, pass);
                
                if (c.getId() == 1) {
                    Alumno al = a.getAlumno(user, pass);
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("alumno", al);
                    response.sendRedirect("menuAlumno.jsp");
                }
                /*Verificar los privilegios
                1.-Alumno
                2.-Apoderado
                3.-Docente
            
                Si es Alumno(1) -> getAlumno(String usuario, String pass). Y creo un objeto Alumno que se SUBE.
                Si es Apoderado(2) -> getApoderado(String usuario, String pass). Y creo un objeto Alumno que se SUBE.
                Si es Docente(3) -> getDocente(String usuario, String pass). Y creo un objeto Alumno que se SUBE.
            
                USUARIO Y PASS LOS OBTENGO DESDE LOS DATOS DE CUENTA RECIBIDOS ANTERIORMENTE.
                */
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(IniciarSesionServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(IniciarSesionServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
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
