package dao;

import java.util.List;
import model.Privilegio;

public interface PrivilegioDAO {
    List<Privilegio> read();
    Privilegio getPrivilegio(int id);
}
