package model;

public class AlumnoAsignatura {
    private int id;        
    private String alumno_fk;
    private int asignatura_fk;

    public AlumnoAsignatura(int id, String alumno_fk, int asignatura_fk) {
        this.id = id;
        this.alumno_fk = alumno_fk;
        this.asignatura_fk = asignatura_fk;
    }

    public AlumnoAsignatura() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAlumno_fk() {
        return alumno_fk;
    }

    public void setAlumno_fk(String alumno_fk) {
        this.alumno_fk = alumno_fk;
    }

    public int getAsignatura_fk() {
        return asignatura_fk;
    }

    public void setAsignatura_fk(int asignatura_fk) {
        this.asignatura_fk = asignatura_fk;
    }   
}
