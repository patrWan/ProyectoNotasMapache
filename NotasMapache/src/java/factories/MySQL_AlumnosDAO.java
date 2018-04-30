package factories;

import dao.AlumnoDAO;
import dao.ConexionDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Alumno;

public class MySQL_AlumnosDAO implements AlumnoDAO {
    private List<Alumno> listaAlumnos;
     private String query;
      
    public MySQL_AlumnosDAO() {
        
    }
    
    @Override
    public void create(Alumno a) {
        String query = "insert into alumno values(null, '" + a.getRut() + "', '" + a.getNombre() + "', '" + a.getApellido() + "', '" + a.getDireccion() + "', '" + a.getApoderado_fk() + "'," + a.getCuenta() + ")";
    }

    @Override
    public List<Alumno> read() {
        try {
            Alumno a;
            listaAlumnos = new ArrayList<>();
            query = "SELECT * FROM alumno";
            ResultSet rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
            while (rs.next()) {
                a = new Alumno();
                a.setId(rs.getInt(1));
                a.setRut(rs.getString(2));
                a.setNombre(rs.getString(3));
                a.setApellido(rs.getString(4));
                a.setDireccion(rs.getString(5));
                a.setApoderado_fk(rs.getInt(6));
                a.setCuenta(rs.getInt(7));
                a.setAlumnoActivo(rs.getBoolean(8));
                
                listaAlumnos.add(a);
            }
//            
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
          return listaAlumnos;
    }

    @Override
    public List<Alumno> getNotas(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) {
        query = "DELETE FROM alumno WHERE id = '"+id+"';";
        
        try {
            ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

    @Override
    public void update(Alumno nuevoAlumno) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
