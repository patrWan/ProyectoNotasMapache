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
    private ResultSet rs;
    MySQL_Conexion c;

    public MySQL_AlumnosDAO() throws SQLException, ClassNotFoundException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);
    }

    @Override
    public void create(Alumno a) {
        try {
            query = "INSERT INTO alumno VALUES('" + a.getRut() + "', '" + a.getNombre() + "','" + a.getApellido() + "', '" + a.getDireccion() + "', '" + a.getApoderado_fk() + "'," + a.getCuenta() + ", TRUE);";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Alumno> read() {
        try {
            Alumno a;
            listaAlumnos = new ArrayList<>();
            query = "SELECT * FROM alumno WHERE alumnoActivo is TRUE ";
            rs = c.ejecutarSelect(query);
            while (rs.next()) {
                a = new Alumno();
                a.setRut(rs.getString(1));
                a.setNombre(rs.getString(2));
                a.setApellido(rs.getString(3));
                a.setDireccion(rs.getString(4));
                a.setApoderado_fk(rs.getString(5));
                a.setCuenta(rs.getInt(6));
                a.setAlumnoActivo(rs.getBoolean(7));

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
        try {
            query = "DELETE FROM alumno WHERE id = '" + id + "';";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void update(Alumno nuevoAlumno) {
        try {
            query = "UPDATE alumno SET nombre = " + nuevoAlumno.getNombre() + " "
                    + ", SET = " + nuevoAlumno.getApellido() + ", set apellido = " + nuevoAlumno.getDireccion() + " "
                    + ", SET direccion = " + nuevoAlumno.getDireccion() + " "
                    + "  WHERE id =" + nuevoAlumno.getRut() + ";";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Alumno getAlumno(int idCuenta) {
        Alumno a = null;
        query = "SELECT * FROM alumno WHERE cuenta = " + idCuenta + " and alumnoActivo is TRUE;";
        rs = c.ejecutarSelect(query);
        try {
            if (rs.next()) {
                a = new Alumno();
                a.setRut(rs.getString(1));
                a.setNombre(rs.getString(2));
                a.setApellido(rs.getString(3));
                a.setDireccion(rs.getString(4));
                a.setApoderado_fk(rs.getString(5));
                a.setCuenta(rs.getInt(6));
                a.setAlumnoActivo(rs.getBoolean(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;

    }

    @Override
    public Alumno getAlumnoByApoderado(String idApoderado) {
        Alumno a = null;
        query = "SELECT * FROM alumno WHERE apoderado_FK = '" + idApoderado + "' and alumnoActivo is TRUE;";
        rs = c.ejecutarSelect(query);
        try {
            if (rs.next()) {
                a = new Alumno();
                a.setRut(rs.getString(1));
                a.setNombre(rs.getString(2));
                a.setApellido(rs.getString(3));
                a.setDireccion(rs.getString(4));
                a.setApoderado_fk(rs.getString(5));
                a.setCuenta(rs.getInt(6));
                a.setAlumnoActivo(rs.getBoolean(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public List<Alumno> getAlumnoByAsignatura(String idAsignatura) {
        Alumno a;
        listaAlumnos = new ArrayList<>();
        query = "SELECT alumno.rut, alumno.nombre FROM alumno, asignatura, alumnoAsignatura\n"
                + "WHERE alumnoAsignatura.alumno = alumno.rut AND alumnoAsignatura.asignatura_fk = asignatura.id\n"
                + "AND asignatura.id ="+idAsignatura;

        rs = c.ejecutarSelect(query);

        try {
            while (rs.next()) {
                a = new Alumno();
                a.setRut(rs.getString(1));
                a.setNombre(rs.getString(2));

                listaAlumnos.add(a);

            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_NotaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaAlumnos;
    }

}
