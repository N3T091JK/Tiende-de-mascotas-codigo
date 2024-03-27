package entidades;
public class Compra extends Entidad{
    private Integer idcompra ;
    private Integer idempleado;
  private Integer iddetallescompra;
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idcompra";
    }
    public Compra() {
         init();
    }

    public Compra(Integer idcompra) {
          init();
        this.idcompra = idcompra;
    }

    public Compra(Integer idempleado, Integer iddetallescompra) {
        init();
        this.idempleado = idempleado;
        this.iddetallescompra = iddetallescompra;
    }

    public Compra(Integer idcompra, Integer idempleado, Integer iddetallescompra) {
        init();
        this.idcompra = idcompra;
        this.idempleado = idempleado;
        this.iddetallescompra = iddetallescompra;
    }

    public Integer getIdcompra() {
        return idcompra;
    }

    public Integer getIdempleado() {
        return idempleado;
    }

    public Integer getIddetallescompra() {
        return iddetallescompra;
    }

    public void setIdcompra(Integer idcompra) {
        this.idcompra = idcompra;
    }

    public void setIdempleado(Integer idempleado) {
        this.idempleado = idempleado;
    }

    public void setIddetallescompra(Integer iddetallescompra) {
        this.iddetallescompra = iddetallescompra;
    }

   
}
