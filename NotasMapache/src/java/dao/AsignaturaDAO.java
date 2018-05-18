package dao;

import java.util.List;
import model.Asignatura;

public interface AsignaturaDAO {
    Asignatura getAsignatura(int id);
    List<Asignatura> getAsignaturaByDocente(String rutDocente);
    List<Asignatura> getAsignaturaByAlumno(String rutAlumno);
}
