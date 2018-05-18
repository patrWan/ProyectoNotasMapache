package factories;

import dao.CuentaDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cuenta;

public class MySQL_CuentaDAO implements CuentaDAO {

    private String query;
    MySQL_Conexion c;
    private ResultSet rs;
    private List<Cuenta> listaCuenta;

    public MySQL_CuentaDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }

    @Override
    public Cuenta getCuenta(String user, String pass) {
        Cuenta cu = null;
        try {
            query = "SELECT * FROM cuenta WHERE usuario = '" + user + "' AND pass = SHA('" + pass + "');";

            rs = c.ejecutarSelect(query);

            if (rs.next()) {
                cu = new Cuenta();
                cu.setId(rs.getInt(1));
                cu.setUsuario(rs.getString(2));
                cu.setPass(rs.getString(3));
                cu.setPrivilegio(rs.getInt(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cu;
    }

    @Override
    public void crearCuenta(Cuenta cu) {        
        query = "INSERT INTO cuenta VALUES(NULL, '" + cu.getUsuario() + "', SHA('" + cu.getPass() + "'), " + cu.getPrivilegio() + ");";
        try {
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   

    @Override
    public List<Cuenta> listaCuentas() {
        listaCuenta = new ArrayList<>();

        query = "SELECT * FROM cuenta;";

        rs = c.ejecutarSelect(query);
        Cuenta cu;
        try {
            while (rs.next()) {
                cu = new Cuenta();
                cu.setId(rs.getInt(1));
                cu.setUsuario(rs.getString(2));
                cu.setPass(rs.getString(3));
                cu.setPrivilegio(rs.getInt(4));
                listaCuenta.add(cu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaCuenta;
    }
}
