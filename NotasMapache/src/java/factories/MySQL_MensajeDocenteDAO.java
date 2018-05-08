package factories;

import dao.MensajeDocenteDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.MensajeDocente;

public class MySQL_MensajeDocenteDAO implements MensajeDocenteDAO {

    private List<MensajeDocente> listaMensajeDocente;
    private String query;
    private ResultSet rs;

    MySQL_Conexion c;

    public MySQL_MensajeDocenteDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }

    @Override
    public void create(MensajeDocente md) {
        try {
            query = "INSERT INTO mensajeDocente VALUES(null, '" + md.getDescripcion() + "', " + md.getCurso_fk() + " ); ";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_MensajeDocenteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public List<MensajeDocente> read() {
        try {
            MensajeDocente md;
            listaMensajeDocente = new ArrayList<>();
            query = "SELECT * FROM mensajeDocente ";
            rs = c.ejecutarSelect(query);
            while (rs.next()) {
                md = new MensajeDocente();
                md.setId(rs.getInt(1));
                md.setDescripcion(rs.getString(2));
                md.setCurso_fk(rs.getInt(3));
                listaMensajeDocente.add(md);
            }
//            
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaMensajeDocente;
    }

    @Override
    public MensajeDocente getMensajeDocente(int id) {
        MensajeDocente md = null;
        listaMensajeDocente = new ArrayList<>();
        query = "SELECT * FROM mensajeDocente WHERE id = " + id + ";";
        rs = c.ejecutarSelect(query);
        try {
            if (rs.next()) {
                md = new MensajeDocente();
                md.setId(rs.getInt(1));
                md.setDescripcion(rs.getString(2));
                md.setCurso_fk(rs.getInt(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return md;
    }

}
