package dao;

import java.util.List;
import model.AlumnoNota;
import model.Nota;

public interface NotaDao {

    void create(Nota n);

    List<Nota> read();

    void update(float valor, int id);

    
    List<Nota> getNotas(int id);
    void delete(String id);
    
    List<AlumnoNota> getNotasbyAsignatura(int asignatura);
    List<AlumnoNota> getNotasbyAsignatura(String rutAlumno);
}
