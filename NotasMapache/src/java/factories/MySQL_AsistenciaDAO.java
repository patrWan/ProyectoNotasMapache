package factories;

import dao.AsistenciaDAO;
import java.util.List;
import model.Asistencia;

public class MySQL_AsistenciaDAO implements AsistenciaDAO{

    @Override
    public void create(Asistencia a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Asistencia> read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(int id, String nuevoAsistencia) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Asistencia> getNotas(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
