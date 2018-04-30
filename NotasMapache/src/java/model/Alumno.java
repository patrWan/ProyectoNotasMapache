package model;

public class Alumno {
    private int id;
    private String rut;
    private String nombre;
    private String apellido;
    private String direccion;
    private int apoderado_fk;
    private int cuenta;
    private boolean alumnoActivo;

    public Alumno(int id, String rut, String nombre, String apellido, String direccion, int apoderado_fk, int cuenta, boolean alumnoActivo) {
        this.id = id;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.apoderado_fk = apoderado_fk;
        this.cuenta = cuenta;
        this.alumnoActivo = alumnoActivo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public Alumno() {
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getApoderado_fk() {
        return apoderado_fk;
    }

    public void setApoderado_fk(int apoderado_fk) {
        this.apoderado_fk = apoderado_fk;
    }

    public int getCuenta() {
        return cuenta;
    }

    public void setCuenta(int cuenta) {
        this.cuenta = cuenta;
    }

    public boolean isAlumnoActivo() {
        return alumnoActivo;
    }

    public void setAlumnoActivo(boolean alumnoActivo) {
        this.alumnoActivo = alumnoActivo;
    }
    
    
}
