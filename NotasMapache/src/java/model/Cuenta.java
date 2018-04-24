package model;

public class Cuenta {

    private int id;
    private String usuario;
    private String pass;
    private int privilegio;

    public Cuenta() {
    }

    public Cuenta(int id, String usuario, String pass, int privilegio) {
        this.id = id;
        this.usuario = usuario;
        this.pass = pass;
        this.privilegio = privilegio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(int privilegio) {
        this.privilegio = privilegio;
    }   

}
