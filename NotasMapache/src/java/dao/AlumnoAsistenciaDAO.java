package dao;

import model.AlumnoAsistencia;

public interface AlumnoAsistenciaDAO {

    void create(AlumnoAsistencia aa);

    void update(AlumnoAsistencia aa);

    AlumnoAsistencia getAlumnoAsistencia(int id);
}
