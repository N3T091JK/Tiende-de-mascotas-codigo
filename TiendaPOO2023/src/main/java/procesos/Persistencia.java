package procesos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
public class Persistencia extends EntityManager{
private Conexion conn;
public Persistencia(Object entidad, Conexion conn) {
super(entidad);
this.conn = conn;
}
public int insertar(){
int valorRetorno;
int filasInsertadas;
try{
PreparedStatement stmt;
stmt = conn.getConexion().prepareStatement(super.getInsert(),PreparedStatement.RETURN_GENERATED_KEYS);
filasInsertadas = stmt.executeUpdate();
//se obtiene la llave generada
ResultSet rs = stmt.getGeneratedKeys();
if (rs.next())
valorRetorno = rs.getInt(1);
else
valorRetorno = filasInsertadas;
stmt.close();
}
catch (SQLException e){
return e.getErrorCode()*-1;
}
return valorRetorno;
}
public int actualizar(String id){
int filasAfectadas;
try{
Statement stmt;
stmt = conn.getConexion().createStatement();
filasAfectadas = stmt.executeUpdate(getUpdate(id));
stmt.close();
}
catch (SQLException e){
return e.getErrorCode()*-1;
}
return filasAfectadas;
}
public int eliminar(String id){
int filasAfectadas;
try{
Statement stmt;
stmt = conn.getConexion().createStatement();
filasAfectadas = stmt.executeUpdate(getDelete(id));
stmt.close();
}
catch (SQLException e){
return e.getErrorCode()*-1;
}
return filasAfectadas;
}
public int eliminar(String[] id){
int filasAfectadas;
try{
Statement stmt;
stmt = conn.getConexion().createStatement();
filasAfectadas = stmt.executeUpdate(getDelete(id));
stmt.close();
}
catch (SQLException e){
return e.getErrorCode()*-1;
}
return filasAfectadas;
}
public HashMap<String, String> getRegistro (String id){
ResultSet rs;
HashMap<String,String> mp=new HashMap();
try {
PreparedStatement ps;
ps = conn.getConexion().prepareStatement(super.getSelect(id));
rs = ps.executeQuery();
rs.next();
for(int i=1; i<=rs.getMetaData().getColumnCount();i++){
System.out.println(rs.getString(i));
mp.put(rs.getMetaData().getColumnName(i), rs.getString(i));
}
rs.close();
}catch (Exception ex) {
System.out.println(ex.getMessage());
}
return mp;
}
}