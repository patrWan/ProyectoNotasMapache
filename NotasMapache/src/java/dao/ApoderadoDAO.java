package dao;

import model.Apoderado;

public interface ApoderadoDAO {
    void create (Apoderado a);
    void update(Apoderado a);
    Apoderado getApoderado(int idCuenta);
}
