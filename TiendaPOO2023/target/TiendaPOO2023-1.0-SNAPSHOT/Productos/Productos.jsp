<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    HashMap Productos;
    String Categorias[][];
    String id = null;
    int sw_nuevo;
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        Productos = Operaciones.getRegistro(new Producto(), id);
       
        sw_nuevo = 0;
    }else{
        sw_nuevo = 1;
        Productos = null;
    }
    Categorias = Operaciones.consultar("select * from categoria");
    %>
<%@include file="../_top.jsp"%>
<h1>Productos</h1>
<br/>
<form name="form_Productos" onsubmit="return validar();" action="Productos_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table2">
    <thead>
        <tr>
            <th colspan="">Complete la información<br><br></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>IdProducto</td>
         <td><input type="text" name="txtIdProducto" value="<%= Productos!=null?Productos.get("idproducto"):"" %>" readonly="readonly" /></td>
        </tr>
        <tr>
            <td>Nombre</td>
            <td><input type="text" name="txtNombre" id="txtNombre" value="<%= Productos!=null? Productos.get("nombre"):"" %>" size="30"/></td>
        </tr> 
        <tr>
            <td>Codigo</td>
            <td><input type="text" name="txtCodigo" id="txtCodigo" value="<%= Productos !=null?Productos.get("codigo"):"" %>" size="30"/></td>
        </tr>
        <tr>
            <td>Precio</td>
            <td><input type="text" name="txtPrecio" id="txtPrecio" value="<%= Productos!=null?Productos.get("precio"):"" %>" size="40"/></td>
        </tr>         
        <tr>
            <td>existencia</td>
            <td><input type="text" name="txtexistencia" id="txtexistencia" value="<%= Productos!=null?Productos.get("existencia"):"" %>" /></td>
        </tr>
        <tr>
            <td>Categoria</td>
            <td>
                <select name="cmbIdCategoria" id="cmbIdCategoria">
                <option value="-1">Seleccione</option>
                <%for (int i=0; i<Categorias[0].length;i++){%>
                <option value="<%= Categorias[0][i] %>"
                <%  if (Productos!=null)
                    if (Categorias[0][i].equals(Productos.get("idcategoria"))) 
                    out.println("selected='selected'"); %>
                        >
                <%= Categorias[1][i] %>
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
        <li><a href="Productos_consulta.jsp">Regresar</a></li>
    </ul>
</div>                     
</form>
 <script>
 
</script>
<%@include file="../_down.jsp"%>
