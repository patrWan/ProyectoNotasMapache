package factories;

import dao.PrivilegioDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Privilegio;

public class MySQL_PrivilegioDAO implements PrivilegioDAO{
    
     private List<Privilegio> listaPrivilegio;
    private String query;
    
    @Override
    public List<Privilegio> read() {
            try {
            Privilegio priv;
            listaPrivilegio = new ArrayList<>();
            query = "SELECT * FROM privilegio";
            ResultSet rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
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
}
