package procesos;
import java.sql.*;
import datos.EncryptedProperties;

public class ConexionBD implements Conexion{
    private String usuario,clave;
    private String servidor,bd, puerto;
    private String url;    
    private Connection conn = null;
    public ConexionBD() throws Exception {          
        usuario = "root";
        clave = "1234";
        servidor = "localhost";
        puerto= "3306";
        bd = "tiendaoficiales";
        //url = "jdbc:mysql://"+servidor+"/"+bd;
        //url = "jdbc:mysql://localhost:3306/bdbiblioteca"; 
        url = "jdbc:mysql://"+servidor+":"+puerto+"/"+bd+"?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    }

    @Override
    public synchronized void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url,usuario,clave);            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException err) {
            System.out.println("Error " + err.getMessage());
        }                
    }
    
    @Override
    public Connection getConexion(){
        return conn;
    }
    
    @Override
    public synchronized void desconectar() {
        try {
                conn.close();
        } catch (SQLException err) {
            System.out.println("Error " + err.getMessage());
        }
    }  
}

/*
package procesos;
import java.sql.*;
import datos.EncryptedProperties;

public class ConexionBD implements Conexion{
    private String usuario;
    private String clave;
    private String url;    
    private Connection conn = null;
    
    public ConexionBD() throws Exception {        
        EncryptedProperties properties = new EncryptedProperties( "AbCdEfGhIj" );       
        try {                                
            properties.load(getClass().getResourceAsStream("config.properties"));            
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        String server_;
        String port_;
        String database_;    
        //usuario = properties.getProperty("Usr");
        //clave = properties.getProperty("Pass");
        server_ = properties.getProperty("Server");
        port_ = properties.getProperty("Port");
        database_ = properties.getProperty("DB");
        //url = "jdbc:mysql://"+server_+":"+port_+"/"+database_;
        url = "jdbc:mysql://localhost:3306/bdbiblioteca";  
    
    }

    @Override
    public synchronized void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url,"root","");
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException err) {
            System.out.println("Error " + err.getMessage());
        }                
    }
    
    @Override
    public Connection getConexion(){
        return conn;
    }
    
    @Override
    public synchronized void desconectar() {
        try {
                conn.close();
        } catch (SQLException err) {
            System.out.println("Error " + err.getMessage());
        }
    }  
}
*/