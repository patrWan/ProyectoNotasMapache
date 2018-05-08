package factories;

import dao.AsistenciaDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Alumno;

import model.Asistencia;

public class MySQL_AsistenciaDAO implements AsistenciaDAO {

    private List<Asistencia> listaAsistencia;
    private String query;
    private ResultSet rs;
    MySQL_Conexion c;

    public MySQL_AsistenciaDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);

    }

    @Override
    public void create(Asistencia a) {
        try {
            query = "insert into asistencia values(null, " + a.getFechaHora() + ")";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AsistenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Asistencia> read() {
        try {
            Asistencia a;
            listaAsistencia = new ArrayList<>();
            query = "SELECT * FROM asistencia";
            ResultSet rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
            while (rs.next()) {
                a = new Asistencia();
                a.setId(rs.getInt(1));
                a.setFechaHora(rs.getString(2));

                listaAsistencia.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AsistenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaAsistencia;
    }

    @Override
    public Asistencia getAsistencia(int id) {
        Asistencia asis = null;
        query = "SELECT * FROM asistencia WHERE id =" + id;
        rs = c.ejecutarSelect(query);

        try {
            if (rs.next()) {
                asis = new Asistencia();
                asis.setId(rs.getInt(1));
                asis.setFechaHora(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AsistenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return asis;
    }

    @Override
    public void delete(String id) {
        try {
            query = "DELETE FROM alumno WHERE id = '" + id + "';";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AsistenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Asistencia a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
