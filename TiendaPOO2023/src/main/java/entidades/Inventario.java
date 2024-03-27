package entidades;
public class Inventario extends Entidad{
    private Integer idinventario ;
    private Integer idproducto;
    private int cantidad;
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idinventario";
    }

    public Inventario() {
        init();
    }

    public Inventario(Integer idinventario) {
         init();
        this.idinventario = idinventario;
    }

    public Inventario(Integer idproducto, int cantidad) {
         init();
        this.idproducto = idproducto;
        this.cantidad = cantidad;
    }

    public Inventario(Integer idinventario, Integer idproducto, int cantidad) {
         init();
        this.idinventario = idinventario;
        this.idproducto = idproducto;
        this.cantidad = cantidad;
    }

    public Integer getIdinventario() {
        return idinventario;
    }

    public Integer getIdproducto() {
        return idproducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setIdinventario(Integer idinventario) {
        this.idinventario = idinventario;
    }

    public void setIdproducto(Integer idproducto) {
        this.idproducto = idproducto;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    
    
}
