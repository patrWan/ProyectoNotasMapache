package model;

public class Nota {
    private int id;
    private int alumnoAsinatura_fk;
    private float valor;
    private float porcentaje;

    public Nota(int id, int alumnoAsinatura_fk, float valor, float porcentaje) {
        this.id = id;
        this.alumnoAsinatura_fk = alumnoAsinatura_fk;
        this.valor = valor;
        this.porcentaje = porcentaje;
    }

    public Nota() {
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
}
