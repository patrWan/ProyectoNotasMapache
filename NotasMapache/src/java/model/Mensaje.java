
package model;


public class Mensaje {

    private int id;
    private String descripcion;
    private int  curso_fk;

    public Mensaje() {
    }

    public Mensaje(int id, String descripcion, int curso_fk) {
        this.id = id;
        this.descripcion = descripcion;
        this.curso_fk = curso_fk;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCurso_fk() {
        return curso_fk;
    }

    public void setCurso_fk(int curso_fk) {
        this.curso_fk = curso_fk;
    }
    
    
}
