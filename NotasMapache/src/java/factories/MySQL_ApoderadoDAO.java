package factories;

import dao.ApoderadoDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Apoderado;

public class MySQL_ApoderadoDAO implements ApoderadoDAO {

    MySQL_Conexion c;
    private String query;
    private ResultSet rs;

    public MySQL_ApoderadoDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }
    @Override
    public void create(Apoderado a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Apoderado getApoderado(int idCuenta) {
        Apoderado a = null;
        query="SELECT * FROM apoderado WHERE cuenta="+idCuenta;
        rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
        
        try {
            if (rs.next()) {
                a = new Apoderado();
                a.setRut(rs.getString(1));
                a.setNombre(rs.getString(2));
                a.setApellido(rs.getString(3));
                a.setCuenta(rs.getInt(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_ApoderadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
}
