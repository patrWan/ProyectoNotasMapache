package factories;

import dao.PrivilegioDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Privilegio;

public class MySQL_PrivilegioDAO implements PrivilegioDAO {

    private List<Privilegio> listaPrivilegio;
    private String query;
    private ResultSet rs;
    
    MySQL_Conexion c;

    public MySQL_PrivilegioDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }
    
    
    
    @Override
    public List<Privilegio> read() {
        try {
            Privilegio priv;
            listaPrivilegio = new ArrayList<>();
            query = "SELECT * FROM privilegio";
            rs = c.ejecutarSelect(query);
            while (rs.next()) {
                priv = new Privilegio();
                priv.setId(rs.getInt(1));
                priv.setDescripcion(rs.getString(2));

                listaPrivilegio.add(priv);
            }
//            
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_PrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaPrivilegio;
    }

    @Override
    public Privilegio getPrivilegio(int id) {
        Privilegio p = null;
        query = "SELECT descripcion FROM privilegio WHERE id="+id;
        rs = c.ejecutarSelect(query);

        try {
            if (rs.next()) {
                p = new Privilegio();
                p.setId(rs.getInt(1));
                p.setDescripcion(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_PrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
}
