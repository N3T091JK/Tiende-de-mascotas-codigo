package entidades;
public class DetallesCompra extends Entidad{
    private Integer iddetallescompra;
    private Integer idproducto;
    private double precio;
    private int cantidad ;
    private double subtotal;
    
        private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "iddetallescompra";
    }

    public DetallesCompra() {
        init();
    }

    public DetallesCompra(Integer iddetallescompra) {
        init();
        this.iddetallescompra = iddetallescompra;
    }

    public DetallesCompra(Integer idproducto, double precio, int cantidad, double subtotal) {
        init();
        this.idproducto = idproducto;
        this.precio = precio;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public DetallesCompra(Integer iddetallescompra, Integer idproducto, double precio, int cantidad, double subtotal) {
        this.iddetallescompra = iddetallescompra;
        this.idproducto = idproducto;
        this.precio = precio;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public Integer getIddetallescompra() {
        return iddetallescompra;
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

    public void setIddetallescompra(Integer iddetallescompra) {
        this.iddetallescompra = iddetallescompra;
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
