package entidades;
public class Empleado extends Entidad{
    private Integer idempleado;
    private Integer idrol;
    private String nombres;
    private String apellidos;   
    private String direccion;

   
  
       private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idempleado";
    }
    public Empleado(){
        init();
    }

    public Empleado(Integer idempleado) {
         init();
        this.idempleado = idempleado;
    }

    public Empleado(Integer idrol, String nombres, String apellidos, String direccion) {
         init();
        this.idrol = idrol;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;

    }

    public Empleado(Integer idempleado, Integer idrol, String nombres, String apellidos, String direccion) {
         init();
        this.idempleado = idempleado;
        this.idrol = idrol;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;

    }
    
   

    public Integer getIdempleado() {
        return idempleado;
    }

    public Integer getIdrol() {
        return idrol;
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

    public void setIdempleado(Integer idempleado) {
        this.idempleado = idempleado;
    }

    public void setIdrol(Integer idrol) {
        this.idrol = idrol;
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

   

 
    
    
    
    
    
}
