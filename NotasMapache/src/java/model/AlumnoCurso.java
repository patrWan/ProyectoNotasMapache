
package model;


public class AlumnoCurso {
 
     private int id;
     private int id_curso;
     private String rut_fk;

    public AlumnoCurso() {
    }

    public AlumnoCurso(int id, int id_curso, String rut_fk) {
        this.id = id;
        this.id_curso = id_curso;
        this.rut_fk = rut_fk;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_curso() {
        return id_curso;
    }

    public void setId_curso(int id_curso) {
        this.id_curso = id_curso;
    }

    public String getRut_fk() {
        return rut_fk;
    }

    public void setRut_fk(String rut_fk) {
        this.rut_fk = rut_fk;
    }
     
    
}
