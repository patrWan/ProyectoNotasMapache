package model;

public class Apoderado {
    private String rut;
    private String nombre;
    private String apellido;
    private int cuenta;

    public Apoderado(String rut, String nombre, String apellido, int cuenta) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.cuenta = cuenta;
    }

    public Apoderado() {
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

    public int getCuenta() {
        return cuenta;
    }

    public void setCuenta(int cuenta) {
        this.cuenta = cuenta;
    }
    
}
