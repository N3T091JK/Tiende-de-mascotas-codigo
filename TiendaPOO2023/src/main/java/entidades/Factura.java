package entidades;
public class Factura extends Entidad{
    
    private Integer idfactura;
    private Integer idcliente;
    private Integer iddetallefactura;   

    
        private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idfactura";
    }

    public Factura() {
        init();
    }

    public Factura(Integer idfactura) {
        init();
        this.idfactura = idfactura;
    }

    public Factura(Integer idcliente, Integer iddetallefactura) {
        init();
        this.idcliente = idcliente;
        this.iddetallefactura = iddetallefactura;
    }

    public Factura(Integer idfactura, Integer idcliente, Integer iddetallefactura) {
     init();
        this.idfactura = idfactura;
        this.idcliente = idcliente;
        this.iddetallefactura = iddetallefactura;
    }

    public Integer getIdfactura() {
        return idfactura;
    }

    public Integer getIdcliente() {
        return idcliente;
    }

    public Integer getIddetallefactura() {
        return iddetallefactura;
    }

    public void setIdfactura(Integer idfactura) {
        this.idfactura = idfactura;
    }

    public void setIdcliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public void setIddetallefactura(Integer iddetallefactura) {
        this.iddetallefactura = iddetallefactura;
    }




    
        
}
