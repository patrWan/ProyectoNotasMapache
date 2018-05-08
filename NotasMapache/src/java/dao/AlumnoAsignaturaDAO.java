/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Alumno;
import model.AlumnoAsignatura;

/**
 *
 * @author luisp
 */
public interface AlumnoAsignaturaDAO {
    void create(AlumnoAsignatura a);

    List<AlumnoAsignatura> read();
    
    List<AlumnoAsignatura> getListAlumnos(String rut);

    void update(AlumnoAsignatura nuevoAlumnoAsignatura);
     
    AlumnoAsignatura getAlumnoByRut(String rutAlumno);

  
  
   
    
}
