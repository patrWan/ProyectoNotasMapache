package dao;

import java.util.List;
import model.Nota;

public interface NotaDao {

    void create(Nota n);

    List<Nota> read();

    void update(Nota nuevoNota);

    
    List<Nota> getNotas(int id);
    void delete(String id);
}
