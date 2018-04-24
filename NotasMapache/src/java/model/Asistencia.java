package model;

public class Asistencia {
    private int id;
    private String fechaHora;

    public Asistencia(int id, String fechaHora) {
        this.id = id;
        this.fechaHora = fechaHora;
    }

    public Asistencia() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }
    
    
    
}
