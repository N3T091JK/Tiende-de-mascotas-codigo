<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    //Creamos una variable para manejar la conexion al pool
    //Conexion conn = new ConexionPool();
    //utilizar esta que esta aqui abajo
    Conexion conn = new ConexionBD();
    //Enviamos la variable de conexion a la clase operaciones
    Operaciones.setConexion(conn);
    //variable HashMap para obtener el registro del pais 
    //en base a un ID cuando se requiera modificacion
    HashMap Rol;   
    String id = null;
    //bandera para manejar el tipo de operacion 
    //insertar=1, actualizar=0
    int sw_nuevo;
    //se verifica si hay un ID de pais enviado
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        //obtenemos el registro del pais en base al ID
        Rol = Operaciones.getRegistro(new Rol(), id);
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        Rol = null;
    }
    %>
<%@include file="../_top.jsp"%>
<h1>Paises</h1>
<br/>
<form name="form_Rol" onsubmit="return validar();" action="Roles_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table2">
    <thead>
        <tr>
            <th colspan="">Complete la información<br><br></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>ID Rol</td>
            <td><input type="text" name="txtIdrol" value="<%= Rol!=null?Rol.get("idrol"):"" %>" readonly="readonly" /></td>
        </tr>
        <tr>
            <td>Nombre Rol</td>
            <td><input type="text" name="txtrol" id="txtrol" value="<%= Rol!=null?Rol.get("rol"):"" %>" /></td>
        </tr>            
    </tbody>
    </table>
    <br/>    
<div class="buttons2">
    <ul>
        <li><input type="submit" value="Guardar" name="guardar"/></li>
        <li><a href="Roles_consulta.jsp">Regresar</a></li>
    </ul>
</div>                     
</form>
 <script>              
</script>
<%@include file="../_down.jsp"%>