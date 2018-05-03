package factories;

import dao.DocenteDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cuenta;
import model.Docente;

public class MySQL_DocenteDAO implements DocenteDAO {

    MySQL_Conexion c;
    private String query;
    private ResultSet rs;

    public MySQL_DocenteDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }

    @Override
    public void create(Docente d, Cuenta cu) {
        query="INSERT INTO docente VALUES('"+d.getRut()+"', '"+d.getNombre()+"','"+d.getApellido()+"', '"+d.getDireccion()+"', '"+d.getCorreo()+"',"+cu.getId()+", TRUE);";
        try {
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_DocenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Docente> read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Docente nuevoAlumno) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Docente> getNotas(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Docente getDocente(int idCuenta) {
        Docente d = null;
        query="SELECT * FROM docente WHERE cuenta="+idCuenta;
        rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
        try {
            if (rs.next()) {
                d = new Docente();
                d.setRut(rs.getString(1));
                d.setNombre(rs.getString(2));
                d.setApellido(rs.getString(3));
                d.setDireccion(rs.getString(4));
                d.setCorreo(rs.getString(5));
                d.setCuenta(rs.getInt(6));
                d.setDocenteActivo(rs.getBoolean(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_DocenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

}
