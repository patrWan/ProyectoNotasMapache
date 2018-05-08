package dao;

import java.util.List;
import model.AlumnoAsistencia;

public interface AlumnoAsistenciaDAO {

    void create(AlumnoAsistencia aa);

    void update(AlumnoAsistencia aa, int id);

    List<AlumnoAsistencia> getAlumnoAsistencia(int id);
}
