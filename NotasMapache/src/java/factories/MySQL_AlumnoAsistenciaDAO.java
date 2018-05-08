package factories;

import dao.AlumnoAsistenciaDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AlumnoAsistencia;

public class MySQL_AlumnoAsistenciaDAO implements AlumnoAsistenciaDAO {

    private List<AlumnoAsistencia> listaAlumnoAsistencia;
    private String query;
    private ResultSet rs;
    MySQL_Conexion c;

    public MySQL_AlumnoAsistenciaDAO() throws SQLException, ClassNotFoundException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }

    @Override
    public void create(AlumnoAsistencia aa) {
        try {
            query = "INSERT INTO AlumnoAsistencia VALUES(null,'" + aa.getAlumnoAsinatura_fk() + "', '" + aa.getAsistencia_fk() + "', '" + aa.isAsistido() + "');";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(AlumnoAsistencia aa, int id) {
        try {
            query = "UPDATE alumnoAsistencia SET alumnoAsignatura_fk =" + aa.getAlumnoAsinatura_fk() + ""
                    + ", SET asistencia_fk = " + aa.getAsistencia_fk() + " "
                    + "  WHERE id = " + id + " ;";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnoAsistenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<AlumnoAsistencia> getAlumnoAsistencia(int id) {
        AlumnoAsistencia aa;
        listaAlumnoAsistencia = new ArrayList<>();

        query = "SELECT * FROM alumnoAsistencia WHERE alumnoAsignatura_fk =" + id;
        rs = c.ejecutarSelect(query);
        try {
            while (rs.next()) {
                aa = new AlumnoAsistencia();
                aa.setId(rs.getInt(1));
                aa.setAlumnoAsinatura_fk(rs.getInt(2));
                aa.setAsistencia_fk(rs.getInt(3));
                aa.setAsistido(rs.getBoolean(4));
                listaAlumnoAsistencia.add(aa);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnoAsistenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaAlumnoAsistencia;
    }
}
