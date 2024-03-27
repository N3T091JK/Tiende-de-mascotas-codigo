<%@include file="../_top.jsp"%>
<%@page import="procesos.*"%>
<%   /*
  String sql = "SELECT idempleado, nombres, apellidos"
          + "direccion,  p.rol "
            + "FROM empleado u, rol p "
            + "WHERE u.idrol = p.idrol ";
  
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1!=null){
        //agrega el filtro a la SQL
        sql += " and nombres like '%"+valor1+"%'";        
    }
*/
   
    String sql = "SELECT u.idempleado, u.nombres, u.apellidos, u.direccion, p.rol " +
                       "FROM empleado u, rol p " +
                       "WHERE u.idrol = p.idrol";
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1!=null){
        //agrega el filtro a la SQL
        sql += " and nombres like '%"+valor1+"%'";        
    }
 
%>

 
<h1>Listado empleado</h1><br>
<script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
    };
</script>    
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="Empleados_consulta.jsp" method="get">
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
        <% out.println("<a href= '/TiendaPOO2023/reportes/reporte_empleado.jsp?valor1="
                + ""+valor1+"' target='BLANK_'><img src='../iconos/pdf.png' "
                        + "width='40' align='absmiddle' style='float:right;' /></a><br/>");%>        
    </form>
</div>             
<div class="buttons" >
    <ul>        
        <li><a href="Empleados.jsp">Nuevo</a></li>
        <li><a href="/TiendaPOO2023/reportes/reporte_empleado.jsp" target="_blank">Ver Reporte</a></li>
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

    String[][] Roles =
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Id",
      "Nombres",
      "apellidos",
      "Direccion",
      "Rol"
    };
    Tabla tab = new Tabla(Roles, //array que contiene los datos
          "90%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    tab.setEliminable(true);
    tab.setModificable(true);    
    tab.setPaginaEliminable("Empleados_operaciones.jsp");
    tab.setPaginaModificable("Empleados.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png"); 
    tab.setPaginaSeleccionable("Empleados.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado Empleado");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
%>
<%@include file="../_down.jsp"%>
