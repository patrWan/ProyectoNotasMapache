package model;

public class AlumnoAsistencia {
    private int id;
    private int alumnoAsinatura_fk;
    private int asistencia_fk;
    private boolean asistido;

    public AlumnoAsistencia(int id, int alumnoAsinatura_fk, int asistencia_fk, boolean asistido) {
        this.id = id;
        this.alumnoAsinatura_fk = alumnoAsinatura_fk;
        this.asistencia_fk = asistencia_fk;
        this.asistido = asistido;
    }

    public AlumnoAsistencia() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAlumnoAsinatura_fk() {
        return alumnoAsinatura_fk;
    }

    public void setAlumnoAsinatura_fk(int alumnoAsinatura_fk) {
        this.alumnoAsinatura_fk = alumnoAsinatura_fk;
    }

    public int getAsistencia_fk() {
        return asistencia_fk;
    }

    public void setAsistencia_fk(int asistencia_fk) {
        this.asistencia_fk = asistencia_fk;
    }

    public boolean isAsistido() {
        return asistido;
    }

    public void setAsistido(boolean asistido) {
        this.asistido = asistido;
    }
}
