<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    HashMap Clientes;
    String id = null;
    int sw_nuevo;
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        Clientes = Operaciones.getRegistro(new Cliente(), id);
        sw_nuevo = 0;
    }else{
        sw_nuevo = 1;
        Clientes = null;
    }
    %>
<%@include file="../_top.jsp"%>
<h1>Clientes</h1>
<br/>
<form name="form_Clientes" onsubmit="return validar();" action="Clientes_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table2">
    <thead>
        <tr>
            <th colspan="">Complete la información<br><br></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>IdCliente</td>
             <td><input type="text" name="txtIdCliente" value="<%= Clientes!=null?Clientes.get("idcliente"):"" %>" readonly="readonly" /></td>
        </tr>
        <tr>
            <td>Nombres</td>
            <td><input type="text" name="txtNombres" id="txtNombres" value="<%= Clientes!=null? Clientes.get("nombres"):"" %>" size="30"/></td>
        </tr> 
        <tr>
            <td>Apellidos</td>
            <td><input type="text" name="txtApellidos" id="txtApellidos" value="<%= Clientes !=null?Clientes.get("apellidos"):"" %>" size="30"/></td>
        </tr>
        <tr>
            <td>Direccion</td>
            <td><input type="text" name="txtDireccion" id="txtDireccion" value="<%= Clientes!=null?Clientes.get("direccion"):"" %>" size="40"/></td>
        </tr>         
        <tr>
            <td>correo</td>
            <td><input type="text" name="txtcorreo" id="txtcorreo" value="<%= Clientes!=null?Clientes.get("correo"):"" %>" /></td>
        </tr>
          <tr>
            <td>Telefono</td>
            <td><input type="text" name="txtTelefono" id="txtTelefono" value="<%= Clientes!=null?Clientes.get("telefono"):"" %>" /></td>
        </tr>
        
    </tbody>
    </table>
    <br/>    
<div class="buttons2">
    <ul>
        <li><input type="submit" value="Guardar" name="guardar"/></li>
        <li><a href="Clientes_consulta.jsp">Regresar</a></li>
    </ul>
</div>                     
</form>
 <script>

</script>
<%@include file="../_down.jsp"%>
