package factories;

import dao.ConexionDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MySQL_Conexion implements ConexionDAO {

    private static Connection con;
    private Statement sentencia;
    private ResultSet rs;

    public MySQL_Conexion(String server, String user, String pass, String bdName) throws ClassNotFoundException, SQLException {
        String protocolo = "jdbc:mysql://";
        String lineaUsuario = "user=" + user;
        String lineaPass = "password=" + pass;

//        String url2 = "jdbc:mysql//"+server+"/"+bdName+"?user="+user+"&pass="+pass;
        String url = protocolo
                + server + "/"
                + bdName + "?"
                + lineaUsuario + "&"
                + lineaPass;

        System.out.println(url);

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url);
    }

    MySQL_Conexion() {
    }

    @Override
    public void conectar() {
        try {
            sentencia = con.createStatement();

        } catch (SQLException ex) {
            Logger.getLogger(MySQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Conectado");
    }

    @Override
    public void desconectar() {
        try {
            sentencia.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Desconectado");
    }

    @Override
    public void ejecutar(String query) throws SQLException {
            conectar();
            sentencia.execute(query);
            desconectar();
   
        System.out.println(query);
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
