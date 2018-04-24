package factories;

import dao.ConexionDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MySQL_Conexion implements ConexionDAO{
    private static Connection con;
    private Statement sentencia;
    private ResultSet rs;

    @Override
    public void conectar(String user, String pass, String server, String bdName) {
        try {
            String protocolo = "jdbc:mysql://";
            String lineaUsuario = "user="+user;
            String lineaPass = "password="+pass;
            
            String url = protocolo + server + "/" + bdName + "?" + lineaUsuario + "&" + lineaPass;
            
            System.out.println(url);
            
            //Cargar en tiempo de ejecucion el Driver de mySql.
            Class.forName("com.mysql.jdbc.Driver");
            
            //Rescatar el objeto Conexion desde el Driver
            con = DriverManager.getConnection(url);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MySQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void desconectar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void ejecutar(String query) throws SQLException {
        sentencia = con.createStatement();
        sentencia.execute(query);
        
        System.out.println(query);
        System.out.println("Ejecutar MySQL");
    }

    @Override
    public ResultSet ejecutarSelect(String select) {
        try {
            sentencia = con.createStatement();
            rs = sentencia.executeQuery(select);
            System.out.println(select);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
}
