package entidades;
public class Cliente extends Entidad {
    private Integer idcliente;
    private String nombres;
    private String apellidos;   
    private String direccion;
    private String correo;
    private String telefono;
private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idcliente";
    }
    public Cliente() {
         init();
    }

    public Cliente(Integer idcliente) {
          init();
        this.idcliente = idcliente;
    }

    public Cliente(String nombres, String apellidos, String direccion, String correo, String telefono) {
          init();
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.correo = correo;
        this.telefono = telefono;
    }

    public Cliente(Integer idcliente, String nombres, String apellidos, String direccion, String correo, String telefono) {
          init();
        this.idcliente = idcliente;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.correo = correo;
        this.telefono = telefono;
    }

    public Integer getIdcliente() {
        return idcliente;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setIdcliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    
    
    
    
}
