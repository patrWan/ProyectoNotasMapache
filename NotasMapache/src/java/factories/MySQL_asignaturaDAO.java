package factories;

import dao.AsignaturaDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Asignatura;

public class MySQL_asignaturaDAO implements AsignaturaDAO {
    private String query;
    MySQL_Conexion c;
    private ResultSet rs;

    public MySQL_asignaturaDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }
    
    
    
    @Override
    public Asignatura getAsignatura(int id) {
        Asignatura a = null;
        query = "SELECT * FROM asignatura WHERE id="+id;
        rs = c.ejecutarSelect(query);
        
        try {
            while (rs.next()) {
                a = new Asignatura();
                a.setId(rs.getInt(1));
                a.setNombre(rs.getString(2));
                a.setDocente_fk(rs.getString(3));
                a.setHorario_fk(rs.getInt(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_asignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return a;
    }
    
}
