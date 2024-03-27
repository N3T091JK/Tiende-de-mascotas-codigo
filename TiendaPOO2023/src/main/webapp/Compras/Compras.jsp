<%@page import="procesos.*" %>
<%@page import="entidades.*" %>
<%
    //se capturan la variables del origen para todos los vuelos
    //si ya ha sido seleccionado un origen
    String idempleado = request.getParameter("idempleado");
    String nombres = request.getParameter("nombres");
%>    
<%@include file="../_top.jsp"%>
<script>
function abrirVentana (URL){
    //funcion javascript para abrir un subventana para realizar
    //busquedas, se le pasa la pagina a mostrar como parametro
    window.open(URL,"ventana1","width=700,height=400,scrollbars=YES,statusbar=YES,top=150,left=300")
}
</script>
        <h1>Registro de Compras realizadas</h1><br><br>
        <form name="main" method="post" action="cp_operaciones.jsp">
            <input type="hidden" name="sw_nuevo" value="1"/>
            <br>
            Seleccione el empleado
            <input type="text" name="txtidcliente" value="<%=idempleado!=null?idempleado:"" %>" size="3" readonly="readonly">
            <input type="text" name="txtnombres" value="<%=nombres!=null?nombres:"" %>" size="50" readonly="readonly">
            <input type="button" class="buttons2" value="..." onclick="abrirVentana('bempleados.jsp');">                       
            <br><br><br><br>
            <hr>
            <br>
           <!-- Fecha y Hora:   -->         
            <!--<input type="datetime-local" name="txtFecha" size="25"> -->           
            <label for="txtidfactura">Id</label>
            <div>
            <input type="text" name="txtiddetallescompra" id="txtiddetallescompra" size="2" readonly="readonly">
            </div>
            <label for="txtidfactura">Producto</label>
            <div>
            <input type="text" name="txtidproducto" id="txtidproducto" readonly="readonly">
            </div>
            <label for="txtidfactura">Precio Unitario</label>
            <div>
             <input type="text" name="txtpreciounitario" id="txtpreciounitario" readonly="readonly">
            </div>
            <label for="txtidfactura">Cantidad</label>
            <div>
              <input type="text" name="txtcantidad" id="txtcantidad" size="2" readonly="readonly">
            </div>
            <label for="txtidfactura">Subtotal</label>
            <div>
               <input type="text" name="txtsubtotal" id="txtsubtotal" readonly="readonly">
            </div>
            
            <input type="button" value="..." class="buttons2" onclick="abrirVentana('bdetallescompra.jsp');">           
          
            <input type="submit" value="Agregar" class="buttons2">
        </form><br><br>
<div id="mensajes" 
     style="width: 95%;text-align: center; height: 14px">
<%
    //se captura el codigo del mensaje
    String result = request.getParameter("result");
    if (result!=null){
        int r = Integer.parseInt(result);
        //obtiene uno de los mensajes definidos en operaciones
        //y lo muestra
        out.println(Operaciones.getMensaje(r));
    }    
%>
</div>        
<%
    
    //Conexion conn = new ConexionPool();
    //Operaciones.setConexion(conn);
    
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
            //      String sql2 = "select cp.id, c.categoria, p.descripción"
            //  + " from producto p, categoria c, categoria_producto cp"
            //  + " where p.IdProducto = cp.IdProducto and p.idCategoria = cp.idCategoria";
    
    //consulta SQL que muestra los vuelos para el destino seleccionado
    /*
    String sql = "select cp.idventa, p.nombre"
            + " from cliente p, detallesventa c, venta cp"
            + " where p.idcliente = cp.idcliente and c.iddetalleventa  = cp.iddetalleventa";
    
      String sql = "select cp.idcompra, p.nombres"
            + " from compra cp, empleado p"
            + " where p.idempleado = cp.idempleado";
    
    */
    
    String sql = "SELECT cp.idcompra,l.nombres, k.nombre, v.precio, v.cantidad, v.subtotal "
            + "FROM compra cp, detallescompra v, producto k, empleado l "
            + "WHERE v.iddetallescompra = cp.iddetallescompra "
            + "AND k.idproducto = v.idproducto AND  l.idempleado = cp.idempleado";
    
 String valor1 = request.getParameter("txtBusqueda");
    if (valor1 != null) {
        sql += " and (l.idempleado like '%" + valor1 + "%' or "
                + " l.nombres like '%" + valor1 + "%') ";
    }
    //array que alamcena el resultado de la consulta SQL    
    String[][] categoria =
    Operaciones.consultar(sql);
  
    //cabeceras a mostrar en la tabla
    String[] cabeceras = new String[]{
      "Id",
      "Empleado",
      "Producto",
      "Precio",
      "Cantidad",
      "Total"
            
            
    };
    
    //variable de tipo Tabla para generar la Tabla HTML
    Tabla tab = new Tabla(categoria, //array que contiene los datos
          "100%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    //boton eleiminat
    tab.setEliminable(true);
    //sin boton modificar
    tab.setModificable(true);
    //pagina para eliminar
    tab.setPaginaEliminable("cp_operaciones.jsp");
    //icono eliminar
    tab.setIconoEliminable("../iconos/delete.png");        
    tab.setIconoModificable("../iconos/edit.png"); 
    //columnas seleccionables
    //tab.setColumnasSeleccionables(new int[]{0,1,2,3,4});
    //pie de tabla
    tab.setPie("Resultado detallescompra");
    
    //imprime la tabla en pantalla
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
    <script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();     
    };
</script>
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="Compras.jsp" method="get">
        Nombre del empleado
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1 != null ? valor1 : "" %>" />
        <input type="submit" value="Buscar"/>
    </form>
 
        
        
</div>        
    
<%@include file="../_down.jsp"%>