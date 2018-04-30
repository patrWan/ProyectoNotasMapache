package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ConexionDAO {
    
    void conectar();
    void desconectar();
    void ejecutar(String query) throws SQLException;
    ResultSet ejecutarSelect(String select);
    
}
