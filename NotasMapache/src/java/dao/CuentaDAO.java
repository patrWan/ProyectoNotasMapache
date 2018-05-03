package dao;

import java.util.List;
import model.Cuenta;

public interface CuentaDAO {
    void crearCuenta(Cuenta c);
    List<Cuenta>listaCuentas();
    Cuenta getCuenta(String user, String pass);
    //CREAR METODOS PARA CREAR CUENTAS.
    
}
