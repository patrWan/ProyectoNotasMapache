package model;

public class Alumno {
    private String rut;
    private String nombre;
    private String direccion;
    private int apoderado_fk;
    private int cuenta;

    public Alumno(String rut, String nombre, String direccion, int apoderado_fk, int cuenta) {
        this.rut = rut;
        this.nombre = nombre;
        this.direccion = direccion;
        this.apoderado_fk = apoderado_fk;
        this.cuenta = cuenta;
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
}
