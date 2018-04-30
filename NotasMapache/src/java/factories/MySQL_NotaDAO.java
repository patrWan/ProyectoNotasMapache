package factories;

import dao.NotaDao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Alumno;
import model.Nota;

public class MySQL_NotaDAO implements NotaDao{
        private List<Nota> listaNotas;
        private String query;
        
        
         public MySQL_NotaDAO() {
        
          ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).conectar("localhost", "root", "123456", "bd_notas");

    }
    @Override
    public void create(Nota n) {
             String query = "insert into nota values(null, '" + n.getAlumnoAsinatura_fk()+ "', '" + n.getValor()+ "',  '" + n.getPorcentaje() + "')";

       }

    @Override
    public List<Nota> read() {
            try {
                Nota n;
                listaNotas = new ArrayList<>();
                query = "SELECT * FROM nota";
                ResultSet rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
                while (rs.next()) {
                    n = new Nota();
                    n.setId(rs.getInt(1));
                    n.setAlumnoAsinatura_fk(rs.getInt(2));
                    n.setValor(rs.getInt(3));
                    
                    n.setPorcentaje(rs.getInt(4));
                    
                    listaNotas.add(n);
                }
            } catch (SQLException ex) {
                Logger.getLogger(MySQL_NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
          return  listaNotas;
    }

    @Override
    public void update(Nota nueNota) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Nota> getNotas(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
     public void delete(String id) {
         query = "DELETE FROM nota WHERE id = '"+id+"';";
    }
    
}
