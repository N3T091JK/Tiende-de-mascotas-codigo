<%@include file="../_top.jsp"%>
<%@page import="procesos.*"%>

<% 
 String sql = "select idcliente,nombres, apellidos,direccion,correo,telefono from cliente ";
          
     String valor1 = request.getParameter("txtBusqueda");
    if (valor1 != null) {
        sql += " and (idcliente like '%" + valor1 + "%' or "
                + " nombres like '%" + valor1 + "%') ";
    }

%>

 
<h1>Listado clientes</h1><br>
<script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
    };
</script>    
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="Clientes_consulta.jsp" method="get">
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>             
<div class="buttons" >
    <ul>        
        <li><a href="Clientes.jsp">Nuevo</a></li>
        <li><a href="/TiendaPOO2023/reportes/reporte_clientes.jsp" target="_blank">Ver Reporte</a></li>
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

    String[][] cliente =
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Id",
       "Nombres",     
      "Apellidos",
      "Direccion",
      "correo",
      "Telefono"
      
     
    };
    Tabla tab = new Tabla(cliente, //array que contiene los datos
          "90%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    tab.setEliminable(true);
    tab.setModificable(true);    
    tab.setPaginaEliminable("Clientes_operaciones.jsp");
    tab.setPaginaModificable("Clientes.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png"); 
    tab.setPaginaSeleccionable("Clientes.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado Clientes");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
%>
<%@include file="../_down.jsp"%>
