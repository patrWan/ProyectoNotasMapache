package model;

public class Asignatura {
    private int id;            
    private String nombre;
    private String docente_fk;
    private int horario_fk;

    public Asignatura(int id, String nombre, String docente_fk, int horario_fk) {
        this.id = id;
        this.nombre = nombre;
        this.docente_fk = docente_fk;
        this.horario_fk = horario_fk;
    }

    public Asignatura() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDocente_fk() {
        return docente_fk;
    }

    public void setDocente_fk(String docente_fk) {
        this.docente_fk = docente_fk;
    }

    public int getHorario_fk() {
        return horario_fk;
    }

    public void setHorario_fk(int horario_fk) {
        this.horario_fk = horario_fk;
    }
    
    
    
}
