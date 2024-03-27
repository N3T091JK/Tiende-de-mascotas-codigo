package entidades;

public class Rol extends Entidad {
    private Integer idrol;
    private String rol;

    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idrol";
    }
    
    public Rol() {
        init();
    }

    public Rol(Integer idrol) {
        init();
        this.idrol = idrol;
    }

    public Rol(String rol) {
        init();
        this.rol = rol;
    }

    public Rol(Integer idrol, String rol) {
  init();
        this.idrol = idrol;
        this.rol = rol;
    }

    public Integer getIdrol() {
        return idrol;
    }

    public String getRol() {
        return rol;
    }

    public void setIdrol(Integer idrol) {
        this.idrol = idrol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }


    
}
