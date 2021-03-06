package dao;

import java.util.List;
import model.Asistencia;


public interface AsistenciaDAO {

    void create(Asistencia a);

    List<Asistencia> read();

    void update(Asistencia a);

    Asistencia getAsistencia(int id);
    
    void delete(String id);
}
