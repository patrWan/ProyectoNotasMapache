package dao;

import model.Apoderado;

public interface ApoderadoDAO {
    void create (Apoderado a);
    Apoderado getApoderado(int idCuenta);
}
