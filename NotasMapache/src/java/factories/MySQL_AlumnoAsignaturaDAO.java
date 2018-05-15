/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package factories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Alumno;
import model.AlumnoAsignatura;
import model.Asistencia;
import dao.AlumnoAsignaturaDAO;
import model.AlumnoAsignaturaId;

/**
 *
 * @author luisp
 */
public class MySQL_AlumnoAsignaturaDAO implements AlumnoAsignaturaDAO {

    private List<AlumnoAsignatura> listaAsignaturas;
    private List<AlumnoAsignaturaId> listaAsignaturasId;
    private String query;
    MySQL_Conexion c;
    private ResultSet rs;

    public MySQL_AlumnoAsignaturaDAO() throws ClassNotFoundException, SQLException {
        c = new MySQL_Conexion(DatoConexion.MySQL.SERVER, DatoConexion.MySQL.USER, DatoConexion.MySQL.PASS, DatoConexion.MySQL.BD);

    }

    @Override
    public void create(AlumnoAsignatura a) {
        try {
            query = "insert into alumnoAsignatura values(null, " + a.getAlumno_fk() + ", " + a.getAsignatura_fk() + ")";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnoAsignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<AlumnoAsignatura> read() {
        AlumnoAsignatura a;
        listaAsignaturas = new ArrayList<>();
        query = "SELECT * FROM alumnoAsignatura";
        rs = c.ejecutarSelect(query);
        try {
            while (rs.next()) {
                a = new AlumnoAsignatura();
                a.setId(rs.getInt(1));
                a.setAlumno_fk(rs.getString(2));
                a.setAsignatura_fk(rs.getInt(3));

                listaAsignaturas.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnoAsignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaAsignaturas;
    }

    @Override
    public void update(AlumnoAsignatura nuevoAlumnoAsignatura) {
        try {
            query = "UPDATE AlumnoAsignatura SET alumno =" + nuevoAlumnoAsignatura.getAlumno_fk() + ""
                    + ", SET asignatura_fk = " + nuevoAlumnoAsignatura.getAsignatura_fk() + ""
                    + " WHERE id " + nuevoAlumnoAsignatura.getId() + ";";
            c.ejecutar(query);
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnoAsignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public AlumnoAsignatura getAlumnoByRut(String rutAlumno) {
        AlumnoAsignatura al = null;
        query = "SELECT * FROM alumnoAsignatura WHERE alumno='" + rutAlumno + "';";
        rs = c.ejecutarSelect(query);

        try {
            if (rs.next()) {
                al = new AlumnoAsignatura();
                al.setId(rs.getInt(1));
                al.setAlumno_fk(rs.getString(2));
                al.setAsignatura_fk(rs.getInt(3));

            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnoAsignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return al;
    }

    @Override
    public List<AlumnoAsignatura> getListAlumnos(String rut) {
        AlumnoAsignatura a;
        listaAsignaturas = new ArrayList<>();
        query = "SELECT * FROM alumnoAsignatura WHERE alumno = '" + rut + "';";
        rs = c.ejecutarSelect(query);
        try {
            while (rs.next()) {
                a = new AlumnoAsignatura();
                a.setId(rs.getInt(1));
                a.setAlumno_fk(rs.getString(2));
                a.setAsignatura_fk(rs.getInt(3));

                listaAsignaturas.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnoAsignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaAsignaturas;
    }

    @Override
    public List<AlumnoAsignaturaId> getListAlumnosAsignaturaId(String asignatura) {
        AlumnoAsignaturaId a;
        listaAsignaturasId = new ArrayList<>();
        query = "SELECT alumnoAsignatura.id, alumno.rut, alumno.nombre, alumno.apellido FROM alumno, asignatura, alumnoAsignatura\n"
                + "WHERE alumnoAsignatura.alumno = alumno.rut AND alumnoAsignatura.asignatura_fk = asignatura.id\n"
                + "AND asignatura.id ="+asignatura;
        rs = c.ejecutarSelect(query);
        try {
            while (rs.next()) {
                a = new AlumnoAsignaturaId();
                a.setIdAlumnoAsignatura(rs.getInt(1));
                a.setRut(rs.getString(2));
                a.setNombre(rs.getString(3));
                a.setApellido(rs.getString(4));

                listaAsignaturasId.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQL_AlumnoAsignaturaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaAsignaturasId;
    }
}


