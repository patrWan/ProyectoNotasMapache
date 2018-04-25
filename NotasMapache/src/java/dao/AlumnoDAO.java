package dao;

import java.util.List;
import model.Alumno;

public interface AlumnoDAO {
    void create(Alumno a);

    List<Alumno> read();

    void update(int id, String nuevoAlumno);

    List<Alumno> getNotas(int id);
}
