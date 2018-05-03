package model;

public class Docente {

    private int id;
    private String rut;
    private String nombre;
    private String apellido;
    private String direccion;
    private String correo;
    private int cuenta;
    private boolean docenteActivo;

    public Docente(int id, String rut, String nombre, String apellido, String direccion, String correo, int cuenta, boolean docenteActivo) {
        this.id = id;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.correo = correo;
        this.cuenta = cuenta;
        this.docenteActivo = docenteActivo;
    }

    public Docente() {
    }

    public int getId() {
        return id;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getCuenta() {
        return cuenta;
    }

    public void setCuenta(int cuenta) {
        this.cuenta = cuenta;
    }

    public boolean isDocenteActivo() {
        return docenteActivo;
    }

    public void setDocenteActivo(boolean docenteActivo) {
        this.docenteActivo = docenteActivo;
    }

}
