package model;

public class AlumnoNota {
    private String rut;
    private String nombre;
    private float valor;
    private float porcentaje;
    private int notaId;

    public AlumnoNota() {
    }

    public AlumnoNota(String rut, String nombre, float valor, float porcentaje, int notaId) {
        this.rut = rut;
        this.nombre = nombre;
        this.valor = valor;
        this.porcentaje = porcentaje;
        this.notaId = notaId;
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

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public float getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(float porcentaje) {
        this.porcentaje = porcentaje;
    }

    public int getNotaId() {
        return notaId;
    }

    public void setNotaId(int notaId) {
        this.notaId = notaId;
    }
    
    
    
    
}
