package entidades;
/**
 *
 * @author HP
 */
public class Categoria_producto  extends Entidad{
    private Integer id;
    private Integer idproducto;
    private Integer idcategoria;

    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "id";
    }
    
    public  Categoria_producto (){
           init();
}

 public Categoria_producto(Integer id) {
        init();
        this.id = id;
    }

 public Categoria_producto(Integer idcategoria, Integer idproducto) {
        init();
        this.idcategoria = idcategoria;
        this.idproducto = idproducto;
    }

 public Categoria_producto(Integer id, Integer idcategoria, Integer idproducto) {
        init();
        this.id = id;
        this.idcategoria = idcategoria;
        this.idproducto = idproducto;
    }

public Integer getId(){
      return id;
}

public void setId(Integer id){
      this.id = id;
}

public Integer getIdcategoria(){
      return idcategoria;
}

public void setIdcategoria(Integer idcategoria){
      this.idcategoria = idcategoria;
}

public Integer getIdproducto(){
      return idproducto;
}

public void setIdproducto(Integer idproducto){
      this.idproducto= idproducto;
}
}
