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
public interface AsignaturaAlumnoDAO {
    void create(AlumnoAsignatura a);

    List<AlumnoAsignatura> read();

    void update(AlumnoAsignatura nuevoAlumnoAsignatura);
     AlumnoAsignatura getAlumno(String rutAlumno);

  
  
   
    
}
