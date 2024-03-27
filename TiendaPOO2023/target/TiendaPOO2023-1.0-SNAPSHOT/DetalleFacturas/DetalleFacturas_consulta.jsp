<%@include file="../_top.jsp"%>
<%@page import="procesos.*"%>
<% 
  /*   
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1!=null){
        sql += " and (IdProducto like '%"+valor1+"%' or "
                + " Nombre like '%"+valor1+"%' or "
                + " Codigo like '%"+valor1+"%')";        
    }
     String sql = "SELECT * FROM detallefactura"; 
    String sql = "SELECT u.iddetallefactura,p.nombre, precio, cantidad, total, v.nombres"
            + "FROM detallefactura u, producto p, empleado v"
            + "WHERE u.idproducto = p.idproducto and u.idempleado = v.idempleado";
 


 
    */
String sql = "SELECT u.iddetallefactura, p.nombre AS producto, u.precio, u.cantidad, u.total, v.nombres AS empleado "
            + "FROM detallefactura u, producto p, empleado v "
            + "WHERE u.idproducto = p.idproducto AND u.idempleado = v.idempleado";

 
    //obtener valor para usar en filtro de la consulta
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1 != null) {
        sql += " and (u.idproducto like '%" + valor1 + "%' or "
                + " nombre like '%" + valor1 + "%') ";
    }
%>

 
<h1>Listado DetalleFacturas</h1><br>
<script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
    };
</script>    
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="DetalleFacturas_consulta.jsp" method="get">
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>             
<div class="buttons" >
    <ul>        
        <li><a href="DetalleFacturas.jsp">Nuevo</a></li>
        <li><a href="/TiendaPOO2023/reportes/reporte_detallefactura.jsp" target="_blank">Ver Reporte</a></li>
    </ul>
</div>            
<br/>
<div id="mensajes" 
     style="width: 50%;text-align: center; height: 14px">
<%
    String result = request.getParameter("result");
    if (result!=null){
        int r = Integer.parseInt(result);
        out.println(Operaciones.getMensaje(r));
    }    
%>
</div>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);

    String[][] Facturas =
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Id",     
      "Producto",
      "Precio",
      "cantidad",
      "Total",
      "Empleado"
      
     
    };
    Tabla tab = new Tabla(Facturas, //array que contiene los datos
          "90%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    tab.setEliminable(true);
    tab.setModificable(true);    
    tab.setPaginaEliminable("DetalleFacturas_operaciones.jsp");
    tab.setPaginaModificable("DetalleFacturas.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png"); 
    tab.setPaginaSeleccionable("DetalleFacturas.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado DetalleFactura");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
%>
<%@include file="../_down.jsp"%>

