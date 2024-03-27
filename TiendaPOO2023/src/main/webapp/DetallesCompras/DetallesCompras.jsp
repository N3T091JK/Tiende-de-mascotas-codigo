<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    HashMap DetallesCompras;
    String Productos[][];
    String id = null;
    int sw_nuevo;
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        DetallesCompras = Operaciones.getRegistro(new DetallesCompra(), id);
        sw_nuevo = 0;
    }else{
        sw_nuevo = 1;
        DetallesCompras = null;
    }
      Productos = Operaciones.consultar("SELECT idproducto, nombre FROM producto");
     
    %>
    
     
<%@include file="../_top.jsp"%>
<h1>DetalleFacturas</h1>
<br/>
<form name="form_DetallesCompras" onsubmit="return validar();" action="DetallesCompras_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table2">
    <thead>
        <tr>
            <th colspan="">Complete la información<br><br></th>
        </tr>              
    </thead>
    <tbody>
        <tr>
            <td>Id DetallesCompras</td>   
        <td><input type="text" name="txtiddetallescompra" value="<%= DetallesCompras!=null?DetallesCompras.get("iddetallescompra"):"" %>" readonly="readonly" /></td>
        
        </tr>
        <tr>
            <td>Precio</td>
            <td><input type="text" name="txtPrecio" id="txtPrecio" value="<%= DetallesCompras!=null? DetallesCompras.get("precio"):"" %>" size="30"/></td>
        </tr> 
        <tr>
            <td>cantidad</td>
            <td><input type="text" name="txtcantidad" id="txtcantidad" value="<%= DetallesCompras !=null?DetallesCompras.get("cantidad"):"" %>" size="30"/></td>
        </tr>
           
      
        <tr>
                <td>Producto</td>
                <td>
                    <select name="cmbIdProducto" id="cmbIdProducto">
                        <option value="-1">Seleccione</option>
                        <% for (int i = 0; i < Productos[0].length; i++) { %>
                            <option value="<%= Productos[0][i] %>"
                                <% if (DetallesCompras != null && Productos[0][i].equals(DetallesCompras.get("idproducto"))) {
                                    out.println("selected='selected'");
                                } %>
                            >
                                <%= Productos[1][i] %>
                            </option>
                        <% } %>
                    </select>
                </td>
            </tr>   
        
        <tr>      
            <td>Se realiza la sumatoria de la compra del producto</td>
            <td><input type="text" name="txtTotal" id="txtTotal" value="<%= DetallesCompras!=null?DetallesCompras.get("subtotal"):"" %>" size="40" readonly="readonly" /><button onclick="multiplicar()" type="submit" value="Guardar" name="guardar">Guardar</button></td>        
        </tr>
        
    </tbody>
    </table>
    <br/>    
<div class="buttons2">
    <ul>
       
        <li><a href="DetallesCompras_consulta.jsp">Regresar</a></li>
    </ul>
</div>                     
</form>
             <script>
        function multiplicar() {
            // Obtener los valores de los campos de texto
            var num1 = parseFloat(document.getElementById('txtPrecio').value) || 0; // Usar 0 si el valor no es un número
            var num2 = parseFloat(document.getElementById('txtcantidad').value) || 0;

            // Realizar la multiplicación
            var resultado = num1 * num2;

            // Mostrar el resultado en el campo de texto con id 'resultado'
            document.getElementById('txtTotal').value = resultado;
        }
    </script>
    
<%@include file="../_down.jsp"%>
