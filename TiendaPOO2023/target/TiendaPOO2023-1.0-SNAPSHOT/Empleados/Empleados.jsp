<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    HashMap Empleados;
    String Roles[][];
    String id = null;
    int sw_nuevo;
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        Empleados = Operaciones.getRegistro(new Empleado(), id);
        sw_nuevo = 0;
    }else{
        sw_nuevo = 1;
        Empleados = null;
    }
    Roles = Operaciones.consultar("select * from rol");
    
    %>
<%@include file="../_top.jsp"%>
<h1>Empleado</h1>
<br/>
<form name="form_Empleado" onsubmit="return validar();" action="Empleados_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table2">
    <thead>
        <tr>
            <th colspan="">Complete la información<br><br></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Empleados</td>
             <td><input type="text" name="txtIdEmpleado" value="<%= Empleados!=null?Empleados.get("idempleado"):"" %>" readonly="readonly" /></td>
               </tr>
        <tr>
            <td>nombres</td>
            <td><input type="text" name="txtnombres" id="txtnombres" value="<%= Empleados!=null? Empleados.get("nombres"):"" %>" size="30"/></td>
        </tr> 
        <tr>
            <td>apellidos</td>
            <td><input type="text" name="txtapellidos" id="txtapellidos" value="<%= Empleados !=null?Empleados.get("apellidos"):"" %>" size="30"/></td>
        </tr>
        <tr>
            <td>Direccion</td>
            <td><input type="text" name="txtDireccion" id="txtDireccion" value="<%= Empleados!=null?Empleados.get("direccion"):"" %>" size="40"/></td>
        </tr>         
        
        
        <tr>
            <td>Rol</td>
            <td>
                <select name="cmbidRol" id="cmbidRol">
                <option value="-1">Seleccione</option>
                <%for (int i=0; i<Roles[0].length;i++){%>
                <option value="<%= Roles[0][i] %>"
                <%  if (Empleados!=null)
                    if (Roles[0][i].equals(Empleados.get("idrol"))) 
                    out.println("selected='selected'"); %>
                        >
                <%= Roles[1][i] %>
                </option>
                <% } %>                    
            </select></td>
        </tr>     
    </tbody>
    </table>
    <br/>    
<div class="buttons2">
    <ul>
        <li><input type="submit" value="Guardar" name="guardar"/></li>
        <li><a href="Empleados_consulta.jsp">Regresar</a></li>
    </ul>
</div>                     
</form>
 <script>

</script>
<%@include file="../_down.jsp"%>