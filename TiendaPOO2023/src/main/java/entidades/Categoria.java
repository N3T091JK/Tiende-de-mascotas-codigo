package entidades;
public class Categoria extends Entidad{
    private Integer idcategoria;    
    private String categoria;
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idcategoria";
    }
       
    public Categoria() {
        init();
    }

    public Categoria(Integer idcategoria) {
        init();
        this.idcategoria = idcategoria;
    }

    public Categoria(String categoria) {
        init();
        this.categoria = categoria;
    }

    public Categoria(Integer idcategoria, String categoria) {
        init();
        this.idcategoria = idcategoria;
        this.categoria = categoria;
    }

    public Integer getIdcategoria() {
        return idcategoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setIdcategoria(Integer idcategoria) {
        this.idcategoria = idcategoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    
    }