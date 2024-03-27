package entidades;

public class Usuarios extends Entidad {   
    private String idusuario;
    private String nombres;
    private String apellidos;   
    private String email;
    private String telefono;
    private String clave;
    private Integer idempleado;   
    private Integer idrol;


    public Usuarios() {
        init();
    }

    public Usuarios(String idusuario) {      
        init();
        this.idusuario = idusuario;
    }

    public Usuarios(String idusuario, String nombres, String apellidos, String email, 
            String telefono, String clave, Integer idrol, Integer idempleado) {
        init();
        this.idusuario = idusuario;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.email = email;
        this.telefono = telefono;
        this.clave = clave;
        this.idrol = idrol;
        this.idempleado = idempleado;
    }
    
    private void init(){
        AUTO_INCREMENT = false;
        PRIMARY_KEY = "idusuario";
        //CLAVE = "clave";
    }    

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public Integer getIdrol() {
        return idrol;
    }

    public void setIdrol(Integer idrol) {
        this.idrol = idrol;
    }

    public Integer getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(Integer idempleado) {
        this.idempleado = idempleado;
    }

 
    
}
