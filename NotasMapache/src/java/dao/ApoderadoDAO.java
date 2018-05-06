package dao;

import model.Apoderado;
import model.Cuenta;

public interface ApoderadoDAO {
    void create (Apoderado a);
    void update(Apoderado a);
    Apoderado getApoderado(int idCuenta);
}
