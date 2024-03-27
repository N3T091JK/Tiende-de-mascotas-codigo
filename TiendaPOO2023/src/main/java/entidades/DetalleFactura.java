package entidades;
public class DetalleFactura extends Entidad{
    private Integer iddetallefactura;
    private Integer idproducto;    
    private double precio;
    private int cantidad;
    private double total;
    private Integer idempleado; 
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "iddetallefactura";
    }

    public DetalleFactura() {
        init();
    }

    public DetalleFactura(Integer iddetallefactura) {
        init();
        this.iddetallefactura = iddetallefactura;
    }

    public DetalleFactura(Integer idproducto, double precio, int cantidad, double total, Integer idempleado) {
        init();
        this.idproducto = idproducto;
        this.precio = precio;
        this.cantidad = cantidad;
        this.total = total;
        this.idempleado = idempleado;
    }

    public DetalleFactura(Integer iddetallefactura, Integer idproducto, double precio, int cantidad, double total, Integer idempleado) {
        init();        
        this.iddetallefactura = iddetallefactura;
        this.idproducto = idproducto;
        this.precio = precio;
        this.cantidad = cantidad;
        this.total = total;
        this.idempleado = idempleado;
    }

    public Integer getIddetallefactura() {
        return iddetallefactura;
    }

    public Integer getIdproducto() {
        return idproducto;
    }

    public double getPrecio() {
        return precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getTotal() {
        return total;
    }

    public Integer getIdempleado() {
        return idempleado;
    }

    public void setIddetallefactura(Integer iddetallefactura) {
        this.iddetallefactura = iddetallefactura;
    }

    public void setIdproducto(Integer idproducto) {
        this.idproducto = idproducto;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public void setIdempleado(Integer idempleado) {
        this.idempleado = idempleado;
    }

    
    
    
}
