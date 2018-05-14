package factories;

import dao.NotaDao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AlumnoNota;
import model.Nota;

public class MySQL_NotaDAO implements NotaDao {

    private List<Nota> listaNotas;
    private List<AlumnoNota> listaAlumnoNotas;
    private String query;
    private ResultSet rs;
    MySQL_Conexion c;

    public MySQL_NotaDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }

    @Override
    public void create(Nota n) {
        try {
            query = "insert into nota values(null, '" + n.getAlumnoAsinatura_fk() + "', '" + n.getValor() + "',  '" + n.getPorcentaje() + "')";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Nota> read() {
        try {
            Nota n;
            listaNotas = new ArrayList<>();
            query = "SELECT * FROM nota";
            rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
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
        return listaNotas;
    }

    @Override
    public void update(float nota, int id) {
        try {
            query = "UPDATE nota SET valor = "+nota+" WHERE id ="+id;
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Nota> getNotas(int id) {
        try {
            Nota n;
            listaNotas = new ArrayList<>();
            query = "SELECT * FROM nota WHERE alumnoAsignatura " + id + "";
            ResultSet rs = ConexionFactory.getInstance().getConexionDAO(ConexionFactory.Motor.MY_SQL).ejecutarSelect(query);
            if (rs.next()) {
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
        return listaNotas;
    }

    @Override
    public void delete(String id) {
        try {
            query = "DELETE FROM nota WHERE id = '" + id + "';";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<AlumnoNota> getNotasbyAsignatura(int asignatura) {
        AlumnoNota an;
        listaAlumnoNotas = new ArrayList<>();
        query = "SELECT alumno.rut, alumno.nombre, nota.valor, nota.porcentaje FROM nota, alumno, asignatura, alumnoAsignatura\n"
                + "WHERE nota.alumnoAsignatura = alumnoAsignatura.id \n"
                + "AND alumnoAsignatura.alumno = alumno.rut AND alumnoAsignatura.asignatura_fk = asignatura.id\n"
                + "AND asignatura.id ="+asignatura;
        
        rs = c.ejecutarSelect(query);
        
        try {
            while (rs.next()) {
                an = new AlumnoNota();
                an.setRut(rs.getString(1));
                an.setNombre(rs.getString(2));
                an.setValor(rs.getFloat(3));
                an.setPorcentaje(rs.getFloat(4));
                
                listaAlumnoNotas.add(an);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        return listaAlumnoNotas;
    }

    @Override
    public List<AlumnoNota> getNotasbyAsignatura(String rutAlumno) {
        AlumnoNota an;
        listaAlumnoNotas = new ArrayList<>();
        query = "SELECT alumno.rut, alumno.nombre, nota.valor, nota.porcentaje, nota.id FROM nota, alumno, asignatura, alumnoAsignatura\n"
                + "WHERE nota.alumnoAsignatura = alumnoAsignatura.id \n"
                + "AND alumnoAsignatura.alumno = alumno.rut AND alumnoAsignatura.asignatura_fk = asignatura.id\n"
                + "AND alumno.rut = '"+rutAlumno+"';";
        
        rs = c.ejecutarSelect(query);
        
        try {
            while (rs.next()) {
                an = new AlumnoNota();
                an.setRut(rs.getString(1));
                an.setNombre(rs.getString(2));
                an.setValor(rs.getFloat(3));
                an.setPorcentaje(rs.getFloat(4));
                an.setNotaId(rs.getInt(5));
                
                listaAlumnoNotas.add(an);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        return listaAlumnoNotas;
    }

}
