package procesos;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;

public class Transacciones {
    private static Conexion conn;
    
    public static void iniciarTransaccion(Conexion conexion){
        conn = conexion;        
        try{
            conn.conectar();
            conn.getConexion().setAutoCommit(false);
        }catch(SQLException e){
            out.println(e.getMessage());
        }
    }
    public static Connection getConexionTransanccion(){
        return conn.getConexion();
    }
    
    public static String[][] consultar(String sql){
        ResultSet rs;
        String[][] results;
        try
        {            
            PreparedStatement ps;
            ps = conn.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();            
            
            rs.last();
            ResultSetMetaData rsmd = rs.getMetaData();
            int numCols = rsmd.getColumnCount();
            int numFils =rs.getRow();
            results=new String[numCols][numFils];
            int j = 0;
            rs.beforeFirst();
            while (rs.next())
            {
                for (int i=0;i<numCols;i++)
                {
                    results[i][j]=rs.getString(i+1);
                }
                j++;
            }            
        }
        catch (SQLException e)
        {
            out.println(e.getMessage());            
            return null;
        }        
        return results;
    }
    
    public static int insertar(Object entidad){
        int r;   
            Persistencia p = new Persistencia(entidad, conn);        
            r = p.insertar();
        return r;
    }
    
    public static int actualizar(Object entidad, String id) {
        int r;   
            Persistencia p = new Persistencia(entidad, conn);        
            r = p.actualizar(id);
        return r;
    }
    
    public static int eliminar(Object entidad, String id) {
        int r;   
            Persistencia p = new Persistencia(entidad, conn);        
            r = p.eliminar(id);
        return r;
    }

    public static int eliminar(Object entidad, String[] id){
        int r;   
            Persistencia p = new Persistencia(entidad, conn);        
            r = p.eliminar(id);
        return r;
    }
    
    public static HashMap<String, String> getRegistro (Object entidad, String id){

        HashMap<String,String> mp;
            Persistencia p = new Persistencia(entidad, conn);        
            mp = p.getRegistro(id);
        return mp;
    }
    
    public static boolean rollback (){
        boolean ok;
        try{
         conn.getConexion().rollback();         
         ok = true;
        }catch(SQLException e){
            out.println(e.getMessage());
            ok = false;
        }
        return ok;
    }

    public static boolean commit (){
        boolean ok;
        try{
         conn.getConexion().commit();         
         ok = true;
        }catch(SQLException e){
            out.println(e.getMessage());
            ok = false;
        }
        return ok;
    }

    public static void desconectar(){
        try{
            conn.getConexion().setAutoCommit(true);
            conn.getConexion().close();            
        }
        catch(SQLException e){
            out.println(e.getMessage());
        }
    }    
}

