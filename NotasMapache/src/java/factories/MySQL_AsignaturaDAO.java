package factories;

import dao.AsignaturaDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Asignatura;

public class MySQL_AsignaturaDAO implements AsignaturaDAO {
    private String query;
    MySQL_Conexion c;
    private ResultSet rs;
    
    private List<Asignatura> listaAsignaturas;

    public MySQL_AsignaturaDAO() throws ClassNotFoundException, SQLException {
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
            Logger.getLogger(MySQL_AsignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return a;
    }

    @Override
    public List<Asignatura> getAsignaturaByDocente(String rutDocente) {
        Asignatura a;
        listaAsignaturas = new ArrayList<>();
        query="SELECT * FROM asignatura WHERE docente_fk = '"+rutDocente+"';";
        rs = c.ejecutarSelect(query);
        
        try {
            while (rs.next()) {
                a = new Asignatura();
                a.setId(rs.getInt(1));
                a.setNombre(rs.getString(2));
                a.setDocente_fk(rs.getString(3));
                a.setHorario_fk(rs.getInt(4));
                
                listaAsignaturas.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AsignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaAsignaturas;
    }
    
}
