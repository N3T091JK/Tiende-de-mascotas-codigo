<%@page import="procesos.*" %>
<%@page import="entidades.*" %>
<%
    //se capturan la variables del origen para todos los vuelos
    //si ya ha sido seleccionado un origen
    String idcliente = request.getParameter("idcliente");
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
        <h1>Registro de Factura realizadas</h1><br><br>
        <form name="main" method="post" action="cp_operaciones.jsp">
            <input type="hidden" name="sw_nuevo" value="1"/>
            <br>
            Seleccione el Cliente
            <input type="text" name="txtidcliente" value="<%=idcliente!=null?idcliente:"" %>" size="3" readonly="readonly">
            <input type="text" name="txtnombres" value="<%=nombres!=null?nombres:"" %>" size="50" readonly="readonly">
            <input type="button" class="buttons2" value="..." onclick="abrirVentana('bclientes.jsp');">                       
            <br><br><br><br>
            <hr>
            <br>
           <!-- Fecha y Hora:   -->         
            <!--<input type="datetime-local" name="txtFecha" size="25"> -->           
            <label for="txtidfactura">Id</label>
            <div>
            <input type="text" name="txtidfactura" id="txtidfactura" size="2" readonly="readonly">
            </div>
            <label for="txtidfactura">Producto:</label>
            <div>
            <input type="text" name="txtidproducto" id="txtidproducto" readonly="readonly">
            </div>
            <label for="txtidfactura">Precio Unitario</label>
            <div>
            <input type="text" name="txtprecio" id="txtprecio" readonly="readonly"> 
            </div> 
             <label for="txtidfactura">Cantidad</label>
            <div>
             <input type="text" name="txtcantidad" id="txtcantidad" size="2" readonly="readonly">
            </div>             
            <label for="txtidfactura">SubTotal</label>
            <div>
             <input type="text" name="txttotal" id="txttotal" readonly="readonly">
            </div>  
                        <label></label>
            <div></div>
            <input type="button" value="..." class="buttons2" onclick="abrirVentana('bDetalleFacturas.jsp');">           

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

          String sql = "select cp.idfactura, p.nombres"
            + " from factura cp, cliente p"
            + " where p.idcliente = cp.idcliente";
    
    
    
    String sql = "SELECT * FROM factura ";
    */
         String sql = "SELECT cp.idfactura, p.nombres, k.nombre, v.precio, v.cantidad, v.total, l.nombres "
            + "FROM factura cp, cliente p, detallefactura v, producto k, empleado l "
            + "WHERE p.idcliente = cp.idcliente AND v.iddetallefactura = cp.iddetallefactura "
            + "AND k.idproducto = v.idproducto AND  l.idempleado = v.idempleado";
         
         String valor1 = request.getParameter("txtBusqueda");
    if (valor1 != null) {
        sql += " and (p.idcliente like '%" + valor1 + "%' or "
                + " p.nombres like '%" + valor1 + "%') ";
         
        
    }
    
  String valor2 = request.getParameter("txtBusqueda2");
    if (valor2 != null) {
        sql += " and (l.idempleado like '%" + valor2 + "%' or "
                + " l.nombres like '%" + valor2 + "%') ";
    }   

    //array que alamcena el resultado de la consulta SQL    
    String[][] factura =
    Operaciones.consultar(sql);
  
    //cabeceras a mostrar en la tabla
    String[] cabeceras = new String[]{
      "Id",
      "Nombre del Cliente",
      "Producto",
      "Precio",
      "cantidad",
      "Total",
      "Empleado"
      
            
            
    };
    
    //variable de tipo Tabla para generar la Tabla HTML
    Tabla tab = new Tabla(factura, //array que contiene los datos
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
    tab.setPie("Resultado DetallesFactura");
    
    //imprime la tabla en pantalla
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
    <script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
        document.getElementById("txtBusqueda2").focus();
    };
</script>
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="Facturas.jsp" method="get">
        Nombre del cliente
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1 != null ? valor1 : "" %>" />
        <input type="submit" value="Buscar"/>
    </form>
 
        
        
</div>
        <p></p>
 <div class="busqueda" style="width: 90%; text-align: right">
    <form action="Facturas.jsp" method="get">
        Nombre del Empleado
        <input type="text" name="txtBusqueda2" id="txtBusqueda"
               value="<%= valor2 != null ? valor2 : "" %>" />
        <input type="submit" value="Buscar"/>
    </form>
 
        
        
</div>               
<%@include file="../_down.jsp"%>