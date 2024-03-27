<%@include file="../_top.jsp"%>
<%@page import="procesos.*"%>
<% 
  /*  String sql = "SELECT IdProducto, Nombre, Codigo, "
            + "Precio, existencia, p.idCategoria  "
            + "FROM productos u, categoria p"
            + "WHERE u.idCategoria = p.idCategoria ";
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1!=null){
        sql += " and (IdProducto like '%"+valor1+"%' or "
                + " Nombre like '%"+valor1+"%' or "
                + " Codigo like '%"+valor1+"%')"; 
    
    
    }*/
  
String sql = "SELECT u.iddetallescompra, p.nombre AS producto, u.precio, u.cantidad, u.subtotal "
            + "FROM detallescompra u, producto p "
            + "WHERE u.idproducto = p.idproducto";

    //obtener valor para usar en filtro de la consulta
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1 != null) {
        sql += " and (u.idproducto like '%" + valor1 + "%' or "
                + " nombre like '%" + valor1 + "%') ";
    }

%>

 
<h1>Listado detallescompra</h1><br>
<script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
    };
</script>    
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="DetallesCompras_consulta.jsp" method="get">
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>             
<div class="buttons" >
    <ul>        
        <li><a href="DetallesCompras.jsp">Nuevo</a></li>
        <li><a href="/TiendaPOO2023/reportes/reporte_detallecompras.jsp" target="_blank">Ver Reporte</a></li>
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

    String[][] Porductos =
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Id",     
      "Producto",
      "Precio",
      "cantidad",
      "Total"
      
     
    };
    Tabla tab = new Tabla(Porductos, //array que contiene los datos
          "90%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    tab.setEliminable(true);
    tab.setModificable(true);    
    tab.setPaginaEliminable("DetallesCompras_operaciones.jsp");
    tab.setPaginaModificable("DetallesCompras.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png"); 
    tab.setPaginaSeleccionable("DetallesCompras.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado DetallesCompras");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
%>
<%@include file="../_down.jsp"%>
