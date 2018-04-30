package dao;

import java.util.List;
import model.Alumno;

public interface AlumnoDAO {
    void create(Alumno a);

    List<Alumno> read();

    void update(Alumno nuevoAlumno);

    List<Alumno> getNotas(int id);
  
    void delete(String id);
}
