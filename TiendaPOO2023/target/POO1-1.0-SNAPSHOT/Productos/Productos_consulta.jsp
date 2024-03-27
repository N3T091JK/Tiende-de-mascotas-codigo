<%@include file="../_top.jsp"%>
<%@page import="procesos.*"%>
<%  
     String sql = "SELECT u.idproducto, p.categoria, descripción, "
            + "costo, precio, stock  "
            + "FROM producto u, categoria p "
            + "WHERE u.idcategoria = p.idcategoria ";
    
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1 != null) {
        sql += " and (u.idproducto like '%" + valor1 + "%' or "
                + " descripción like '%" + valor1 + "%') ";
    }
%>

 
<h1>Listado Productos</h1><br>
<script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
    };
</script>    
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="Productos_consulta.jsp" method="get">
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>             
<div class="buttons" >
    <ul>        
        <li><a href="Productos.jsp">Nuevo</a></li>
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

    String[][] Categorias =
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Id",
       "Categoria", 
      "Descripcion",     
      "Costo",
      "Precios",
      "Stokp"
      
      
     
    };
    Tabla tab = new Tabla(Categorias, //array que contiene los datos
          "90%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    tab.setEliminable(true);
    tab.setModificable(true);    
    tab.setPaginaEliminable("Productos_operaciones.jsp");
    tab.setPaginaModificable("Productos.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png"); 
    tab.setPaginaSeleccionable("Productos.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado Productos");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
%>
<%@include file="../_down.jsp"%>
