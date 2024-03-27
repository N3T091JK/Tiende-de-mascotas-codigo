package entidades;
public class Producto extends Entidad{
    private Integer idproducto;
    private Integer idcategoria;
    private String codigo;
    private String nombre;   
    private double precio;
    private Integer existencia;

private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idproducto";
    }

    public Producto() {
         init();
    }

    public Producto(Integer idproducto) {
         init();
        this.idproducto = idproducto;
    }

    public Producto(Integer idcategoria, String codigo, String nombre, double precio, Integer existencia) {
              init();
        this.idcategoria = idcategoria;
        this.codigo = codigo;
        this.nombre = nombre;
        this.precio = precio;
        this.existencia = existencia;
    }

    public Producto(Integer idproducto, Integer idcategoria, String codigo, String nombre, double precio, Integer existencia) {
              init();
        this.idproducto = idproducto;
        this.idcategoria = idcategoria;
        this.codigo = codigo;
        this.nombre = nombre;
        this.precio = precio;
        this.existencia = existencia;
    }

    public Integer getIdproducto() {
        return idproducto;
    }

    public Integer getIdcategoria() {
        return idcategoria;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public Integer getExistencia() {
        return existencia;
    }

    public void setIdproducto(Integer idproducto) {
        this.idproducto = idproducto;
    }

    public void setIdcategoria(Integer idcategoria) {
        this.idcategoria = idcategoria;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public void setExistencia(Integer existencia) {
        this.existencia = existencia;
    }

    
    
    
}
