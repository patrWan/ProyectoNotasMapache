
package model;


public class Curso {

   private int id;
   private String carrera;
   private int años;
   private int cantidad_alumno;

    public Curso() {
    }

    public Curso(int id, String carrera, int años, int cantidad_alumno) {
        this.id = id;
        this.carrera = carrera;
        this.años = años;
        this.cantidad_alumno = cantidad_alumno;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public int getAños() {
        return años;
    }

    public void setAños(int años) {
        this.años = años;
    }

    public int getCantidad_alumno() {
        return cantidad_alumno;
    }

    public void setCantidad_alumno(int cantidad_alumno) {
        this.cantidad_alumno = cantidad_alumno;
    }
   
    
}
