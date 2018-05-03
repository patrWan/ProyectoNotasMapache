package dao;

import java.util.List;
import model.Cuenta;
import model.Docente;

public interface DocenteDAO {
     void create(Docente a, Cuenta c);

    List<Docente> read();

    void update(Docente nuevoAlumno);

    List<Docente> getNotas(int id);
  
    void delete(String id);
    
    Docente getDocente(int idCuenta);
}
