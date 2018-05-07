package dao;

import model.AlumnoAsistencia;

public interface AlumnoAsistenciaDAO {

    void create(AlumnoAsistencia aa);

    void update(AlumnoAsistencia aa, int id);

    AlumnoAsistencia getAlumnoAsistencia(int id);
}
