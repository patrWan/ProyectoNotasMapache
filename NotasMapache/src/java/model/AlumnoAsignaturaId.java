package model;

public class AlumnoAsignaturaId {
    private int idAlumnoAsignatura;
    private String rut;
    private String nombre;
    private String apellido;

    public AlumnoAsignaturaId() {
    }

    public AlumnoAsignaturaId(int idAlumnoAsignatura, String rut, String nombre, String apellido) {
        this.idAlumnoAsignatura = idAlumnoAsignatura;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public int getIdAlumnoAsignatura() {
        return idAlumnoAsignatura;
    }

    public void setIdAlumnoAsignatura(int idAlumnoAsignatura) {
        this.idAlumnoAsignatura = idAlumnoAsignatura;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    
}
