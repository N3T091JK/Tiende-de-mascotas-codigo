<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    HashMap DetalleFacturas;
    String Productos[][];
    String Empleado[][];
    String id = null;
    int sw_nuevo;
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        DetalleFacturas = Operaciones.getRegistro(new DetalleFactura(), id);
        sw_nuevo = 0;
    }else{
        sw_nuevo = 1;
        DetalleFacturas = null;
    }
    Productos = Operaciones.consultar("SELECT idproducto, nombre FROM producto");
  Empleado = Operaciones.consultar("select idempleado,nombres from empleado");
    %>
<%@include file="../_top.jsp"%>
<h1>DetalleFacturas</h1>
<br/>
<form name="form_DetalleFacturas" onsubmit="return validar();" action="DetalleFacturas_operaciones.jsp" method="POST">
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
             <td><input type="text" name="txtiddetallefactura" value="<%= DetalleFacturas!=null?DetalleFacturas.get("iddetallefactura"):"" %>" readonly="readonly" /></td>
        </tr>
        <tr>
            <td>Precio</td>
            <td><input type="text" name="txtPrecio" id="txtPrecio" value="<%= DetalleFacturas!=null? DetalleFacturas.get("precio"):"" %>" size="30"/></td>
        </tr> 
        <tr>
            <td>cantidad</td>
            <td><input type="text" name="txtcantidad" id="txtcantidad" value="<%= DetalleFacturas !=null?DetalleFacturas.get("cantidad"):"" %>" size="30"/></td>
        </tr>
                             
                <tr>
                <td>Producto</td>
                <td>
                    <select name="cmbIdProducto" id="cmbIdProducto">
                        <option value="-1">Seleccione</option>
                        <% for (int i = 0; i < Productos[0].length; i++) { %>
                        <option value="<%= Productos[0][i] %>" <% if (DetalleFacturas != null) if (Productos[0][i].equals(DetalleFacturas.get("idproducto"))) out.println("selected='selected'"); %>>
                            <%= Productos[1][i] %>
                        </option>
                        <% } %>
                    </select>
                </td>
            </tr>
            
         <tr>
                <td>empleado</td>
                <td>
                    <select name="cmbidempleado" id="cmbidempleado">
                        <option value="-1">Seleccione</option>
                        <% for (int i = 0; i < Empleado[0].length; i++) { %>
                        <option value="<%= Empleado[0][i] %>" <% if (DetalleFacturas != null) if (Empleado[0][i].equals(DetalleFacturas.get("idempleado"))) out.println("selected='selected'"); %>>
                            <%= Empleado[1][i] %>
                        </option>
                        <% } %>
                    </select>
                </td>
            </tr>   
            <tr>
            <td>Total</td>
            <td><input type="text" name="txtTotal" id="txtTotal" value="<%= DetalleFacturas!=null?DetalleFacturas.get("total"):"" %>" size="40" readonly="readonly"/><button onclick="multiplicar()" type="submit" value="Guardar" name="guardar">Guardar</button></td>
        </tr> 
            
        
    </tbody>
    </table>
    <br/>    
<div class="buttons2">
    <ul>
       
        <li><a href="DetalleFacturas_consulta.jsp">Regresar</a></li>
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
