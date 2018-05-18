package dao;

import java.util.List;
import model.MensajeDocente;

public interface MensajeDocenteDAO {

    void create(MensajeDocente md);
    
    List<MensajeDocente> read();

    MensajeDocente getMensajeDocente(int id);
    
    List<MensajeDocente> getMensajeDocenteByAlumnoAsignatura (int idAlumnoAsig);
}
