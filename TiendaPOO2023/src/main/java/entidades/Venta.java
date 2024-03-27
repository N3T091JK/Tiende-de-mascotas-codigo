package entidades;
public class Venta extends Entidad{
    private Integer idventa;
    private Integer idempleado;
    private Integer iddetalleventa;
   
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idventa";
    }

    public Venta() {
        init();
    }

    public Venta(Integer idventa) {
         init();
        this.idventa = idventa;
    }

    public Venta(Integer idempleado, Integer iddetalleventa) {
        init();
        this.idempleado = idempleado;
        this.iddetalleventa = iddetalleventa;
    }

    public Venta(Integer idventa, Integer idempleado, Integer iddetalleventa) {
        init();
        this.idventa = idventa;
        this.idempleado = idempleado;
        this.iddetalleventa = iddetalleventa;
    }

    public Integer getIdventa() {
        return idventa;
    }

    public Integer getIdempleado() {
        return idempleado;
    }

    public Integer getIddetalleventa() {
        return iddetalleventa;
    }

    public void setIdventa(Integer idventa) {
        this.idventa = idventa;
    }

    public void setIdempleado(Integer idempleado) {
        this.idempleado = idempleado;
    }

    public void setIddetalleventa(Integer iddetalleventa) {
        this.iddetalleventa = iddetalleventa;
    }

    
}