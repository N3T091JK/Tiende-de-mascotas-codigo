package procesos;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EntityManager {
    private String NombreEntidad;
    private String Entidad;
    private String NombreTabla;
    private Object Objeto;
    private Object PRIMARY_KEY;
    private boolean AUTO_INCREMENT;
    //private Object CLAVE;
    
    public EntityManager(Object entidad) {
        Objeto = entidad;
        Entidad = entidad.getClass().getName();
        NombreEntidad = entidad.getClass().getSimpleName();
        getPrimaryKey();        
    }
    
    private void getPrimaryKey() {
        try {
            Field fpk = Objeto.getClass().getField("PRIMARY_KEY");
            PRIMARY_KEY = fpk.get(Objeto); 
            //Field fclave = Objeto.getClass().getField("CLAVE");
            //CLAVE = fpk.get(Objeto);            
            Field fa = Objeto.getClass().getField("AUTO_INCREMENT"); 
            AUTO_INCREMENT = (boolean)fa.get(Objeto);
        } catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException ex) {
            Logger.getLogger(EntityManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private Field[] getCampos() throws ClassNotFoundException, NoSuchMethodException{
        Class<?> c;
        c = Class.forName(Entidad);
	Field[] f = c.getDeclaredFields();
        return f;
    }
    
    private String getListaCampos(){
        String r="";
        try{
        Field[] f = getCampos();             
            for (int i =0;i<f.length;i++){
                if (AUTO_INCREMENT && f[i].getName().equals(PRIMARY_KEY.toString())){
                    //no incluye el campo llave
                }else{
                    r+=f[i].getName() + ",";
                }
            }
            r=r.substring(0, r.length()-1);
        }catch(ClassNotFoundException | NoSuchMethodException e){
        
        }
        return r;
    }
    
    private String getTodosCampos(){
        String r="";
        try{
        Field[] f = getCampos();             
            for (int i =0;i<f.length;i++){
                    r+=f[i].getName() + ",";                
            }
            r=r.substring(0, r.length()-1);
        }catch(ClassNotFoundException | NoSuchMethodException e){
        
        }
        return r;
    }
    
    private String getListaValores(){
        String r="";
        String[] aux = getListaCampos().split(",");
        String[] nombres_metodos = new String[aux.length];
        int i =0;
        for (String v: aux){
            nombres_metodos[i] = "get"+ 
                    String.valueOf(v.charAt(0)).toUpperCase() + 
                    v.substring(1);            
            i++;
        }
        try{                        
            for (String metodo: nombres_metodos){
                Method met = Objeto.getClass().getMethod(metodo);                
                Object value = met.invoke(Objeto);
                if (value==null)
                    r +=  "null,";
                else
                    r +=  "'"+value.toString() + "',";
            }
            r=r.substring(0, r.length()-1);
        }catch(NoSuchMethodException  |
                IllegalAccessException | InvocationTargetException e){
            System.out.println(e.getMessage());
        }

        return r;
    }    
    
    protected  String getSelect(String id) {
        String sqlinsert = "select " + getTodosCampos()+ " from " + NombreEntidad.toLowerCase() +
                " where "+PRIMARY_KEY.toString()+" = '" + id+ "'";                
        return sqlinsert;
    }
    
    protected String getInsert() {
        String sqlinsert = "insert into " + NombreEntidad.toLowerCase() + " (" + getListaCampos() + ")"
                + " values ("+ getListaValores() + ")";                
        return sqlinsert;
    }
    
    protected String getUpdate(String id) {
        String sqlupdate = "update " + NombreEntidad.toLowerCase() + " set ";  
        String[] campos = getListaCampos().split(",");
        String[] valores = getListaValores().split(",");
        for (int i=0;i<campos.length;i++){
            sqlupdate+= campos[i]+"="+valores[i]+",";
        }
        
        sqlupdate=sqlupdate.substring(0, sqlupdate.length()-1);        
        
        sqlupdate+=" where "+PRIMARY_KEY.toString()+" = '" + id+ "'";
        return sqlupdate;
    }
    
    protected String getDelete(String id) {
        String sqldelete = "delete from " + NombreEntidad.toLowerCase() 
                + " where "+PRIMARY_KEY.toString()+" = '" + id+ "'";           
        return sqldelete;
    }
    
    protected String getDelete(String[] id) {
        String sqldelete = "delete from " + NombreEntidad.toLowerCase() 
                + " where "+PRIMARY_KEY.toString()+" in ("+ EntityManager.join(id) +")";           
        return sqldelete;
    }
    
    private static String join(String[] lista){
        String cad="";
        for (int i =0;i<lista.length;i++){
                cad+="'" + lista[i] + "',";
            }
            cad=cad.substring(0, cad.length()-1);
        return cad;
    }
    
}
