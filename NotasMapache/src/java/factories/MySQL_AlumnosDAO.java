package factories;

import dao.AlumnoDAO;
import java.util.List;
import model.Alumno;

public class MySQL_AlumnosDAO implements AlumnoDAO {

    @Override
    public void create(Alumno a) {
        String query = "insert into alumno values(null, '" + a.getRut() + "', '" + a.getNombre() + "', '" + a.getApellido() + "', '" + a.getDireccion() + "', '" + a.getApoderado_fk() + "'," + a.getCuenta() + ")";
    }

    @Override
    public List<Alumno> read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(int id, String nuevoAlumno) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Alumno> getNotas(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
