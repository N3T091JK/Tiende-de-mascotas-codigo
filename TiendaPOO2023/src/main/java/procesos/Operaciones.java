package procesos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
public class Operaciones {
private static Conexion conn;
public static void setConexion(Conexion conexion){
conn = conexion;
}
public static String[][] consultar(String sql){
    ResultSet rs;
    String[][] results;
    try
    {
        conn.conectar();
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
        conn.desconectar();
    }
    catch (SQLException e)
    {
        System.out.println(e.getMessage());
        conn.desconectar();
        return null;
    }
    return results;
}
public static int insertar(Object entidad){
    int r;
    conn.conectar();
    Persistencia p = new Persistencia(entidad, conn);
    r = p.insertar();
    conn.desconectar();
    return r;
}
public static int actualizar(Object entidad, String id) {
    int r;
    conn.conectar();
    Persistencia p = new Persistencia(entidad, conn);
    r = p.actualizar(id);
    conn.desconectar();
    return r;
}
public static int eliminar(Object entidad, String id) {
    int r;
    conn.conectar();
    Persistencia p = new Persistencia(entidad, conn);
    r = p.eliminar(id);
    conn.desconectar();
    return r;
}
public static int eliminar(Object entidad, String[] id){
    int r;
    conn.conectar();
    Persistencia p = new Persistencia(entidad, conn);
    r = p.eliminar(id);
    conn.desconectar();
    return r;
}
public static HashMap<String, String> getRegistro (Object entidad, String id){
    HashMap<String,String> mp;
    conn.conectar();
    Persistencia p = new Persistencia(entidad, conn);
    mp = p.getRegistro(id);
    conn.desconectar();
    return mp;
}
public static int OK_INSERTAR=1;
public static int OK_ACTUALIZAR=2;
public static int OK_ELIMINAR=3;
public static int ERROR_INSERTAR=4;
public static int ERROR_ACTUALIZAR=5;
public static int ERROR_ELIMINAR=6;
public static String getMensaje(int resultado){
String Msg="";
String estilo_error="style='color:red;font-weight: bolder;font-size: 14px;'";
String estilo_ok="style='color:blue;font-weight: bolder;font-size: 14px;'";
switch (resultado){
case 1:
Msg = "<p "+estilo_ok+">Registro guardado satisfactoriamente</p>";
break;
case 2:
Msg = "<p "+estilo_ok+">Registro actualizado satisfactoriamente</p>";
break;
case 3:
Msg = "<p "+estilo_ok+">Registro eliminado satisfactoriamente</p>";
break;
case 4:
Msg = "<p "+estilo_error+">Error al intentar guardar</p>";
break;
case 5:
Msg = "<p "+estilo_error+">Error al intentar actualizar</p>";
break;
case 6:
Msg = "<p "+estilo_error+">Error al intentar eliminar</p>";
break;
}
return Msg;
}
}