<%@include file="../_top.jsp"%>
<%@page import="procesos.*"%>
<% 
    //es donde se le muestra el codigo 
  String sql = "SELECT idinventario, p.nombre, cantidad "
            + "FROM inventario u, producto p "
            + "WHERE u.idproducto = p.idproducto ";
  
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1!=null){
        //agrega el filtro a la SQL
        sql += " and nombre like '%"+valor1+"%'";        
    }

%>

<h1>Listado de Inventario de Productos</h1><br>
<script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
    };
</script>    
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="Inventarios_consulta.jsp" method="get">
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>             
<div class="buttons" >
    <ul>        
        <li><a href="Inventarios.jsp">Nuevo</a></li>
        <li><a href="/TiendaPOO2023/reportes/reporte_inventario.jsp" target="_blank">Ver Reporte</a></li>
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

    String[][] Producto =
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Id",
       "Producto",     
      "Stopk"    
    };
    Tabla tab = new Tabla(Producto, //array que contiene los datos
          "90%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    tab.setEliminable(true);
    tab.setModificable(true);    
    tab.setPaginaEliminable("Inventarios_operaciones.jsp");
    tab.setPaginaModificable("Inventarios.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png"); 
    tab.setPaginaSeleccionable("Inventarios.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado Inventarios");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
%>
<%@include file="../_down.jsp"%>