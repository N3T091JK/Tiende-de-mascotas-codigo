<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    HashMap Inventarios;
    String Producto[][];
    String id = null;
    int sw_nuevo;
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        Inventarios = Operaciones.getRegistro(new Inventario(), id);
        sw_nuevo = 0;
    }else{
        sw_nuevo = 1;
        Inventarios = null;
    }
    Producto = Operaciones.consultar("SELECT idproducto, nombre, existencia FROM producto");
    %>
<%@include file="../_top.jsp"%>
<h1>Inventario</h1>
<br/>
<form name="form_Productos" onsubmit="return validar();" action="Inventarios_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table2">
    <thead>
        <tr>
            <th colspan="">Complete la información<br><br></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Inventario id</td>
        <td><input type="text" name="txtIdInventario" value="<%= Inventarios!=null?Inventarios.get("idinventario"):"" %>" readonly="readonly" /></td>
        </tr>          
        <tr>
            <td>existencia</td>
            <td><input type="text" name="txtCantidad" id="txtCantidad" value="<%= Inventarios!=null?Inventarios.get("cantidad"):"" %>" /></td>
        </tr>      
         <tr>
                <td>Productos</td>
                <td>
                    <select name="cmbIdProductos" id="cmbIdProductos">
                        <option value="-1">Seleccione</option>
                        <% for (int i = 0; i < Producto[0].length; i++) { %>
                        <option value="<%= Producto[0][i] %>" <% if (Inventarios != null) if (Producto[0][i]==Inventarios.get("idproducto")) out.println("selected"); %>>
                            <%= Producto[1][i] %>
                        </option>
                        <% } %>
                    </select>
                </td>
            </tr>
                   
    </tbody>
    </table>
    <br/>    
<div class="buttons2">
    <ul>
        <li><input type="submit" value="Guardar" name="guardar"/></li>
        <li><a href="Inventarios_consulta.jsp">Regresar</a></li>
    </ul>
</div>                     
</form>

<%@include file="../_down.jsp"%>
