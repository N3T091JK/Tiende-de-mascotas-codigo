package entidades;
public class DetallesVenta extends Entidad{
    private Integer iddetalleventa;
    private Integer idproducto;
    private double precio;
    private int cantidad;
    private double subtotal;
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "iddetalleventa";
    }

    public DetallesVenta() {
        init();
    }

    public DetallesVenta(Integer iddetalleventa) {
 init();
        this.iddetalleventa = iddetalleventa;
    }

    public DetallesVenta(Integer idproducto, double precio, int cantidad, double subtotal) {
init();
        this.idproducto = idproducto;
        this.precio = precio;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public DetallesVenta(Integer iddetalleventa, Integer idproducto, double precio, int cantidad, double subtotal) {
init();
        this.iddetalleventa = iddetalleventa;
        this.idproducto = idproducto;
        this.precio = precio;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public Integer getIddetalleventa() {
        return iddetalleventa;
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

    public double getSubtotal() {
        return subtotal;
    }

    public void setIddetalleventa(Integer iddetalleventa) {
        this.iddetalleventa = iddetalleventa;
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

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    
    
}
