package factories;

import dao.AsistenciaDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Alumno;

import model.Asistencia;

public class MySQL_AsistenciaDAO implements AsistenciaDAO{
        private List<Asistencia> listaAsistencia;
     private String query;
     
     
     
         
    public MySQL_AsistenciaDAO() {
        
          ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).conectar("localhost", "root", "123456", "bd_notas");

    }
    
    @Override
    public void create(Asistencia a) {
         String query = "insert into asistencia values(null, " + a.getFechaHora()+ ")";
    }

    @Override
    public List<Asistencia> read() {
            try {
                Asistencia a;
                listaAsistencia= new ArrayList<>();
                query = "SELECT * FROM asistencia";
                ResultSet rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
                while (rs.next()) {
                    a = new Asistencia();
                    a.setId(rs.getInt(1));
                    a.setFechaHora(rs.getString(2));
                    
                    
                    listaAsistencia.add(a);
                }
            } catch (SQLException ex) {
                Logger.getLogger(MySQL_AsistenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return listaAsistencia;
    }


    @Override
    public List<Asistencia> getNotas(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) {
        query = "DELETE FROM alumno WHERE id = '"+id+"';";
    }

    @Override
    public void update(Asistencia a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
