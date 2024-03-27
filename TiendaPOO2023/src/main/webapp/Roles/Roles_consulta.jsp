<%@include file="../_top.jsp"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<% 
    //consulta SQL para los paises
    String sql = "SELECT * FROM rol where 1 ";
    //obtener valor para usar en filtro de la consulta
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1!=null){
        //agrega el filtro a la SQL
        sql += " and rol like '%"+valor1+"%'";        
    }  
%>
<h1>Listado Rol</h1><br>
<script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
    };
</script>    
<div class="busqueda" style="width: 50%; text-align: right">
    <form action="Roles_consulta.jsp" method="get">
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
         <% out.println("<a href= '/TiendaPOO2023/reportes/Reporte_empleado.jsp?valor1="
                + ""+valor1+"' target='BLANK_'><img src='../iconos/pdf.png' "
                        + "width='40' align='absmiddle' style='float:right;' /></a><br/>");%>
    </form>
</div>             
<div class="buttons" >
    <ul>        
        <li><a href="Roles.jsp">Nuevo</a></li>
        <%--<li><a href="/TiendaPOO2023/reportes/reporte_rol.jsp" target="_blank">Ver Reporte</a></li> --%>
    </ul>
</div>            
<br/>
<div id="mensajes" 
     style="width: 50%;text-align: center; height: 14px">
<%
    //captura el mensaje de la operacion realizada
    String result = request.getParameter("result");
    if (result!=null){        
        int r = Integer.parseInt(result);
        //obtiene uno de los mensajes definidos en operaciones
        out.println(Operaciones.getMensaje(r));
    }    
%>
</div>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    
    //array que alamcena el resultado de la consulta SQL
    String[][] Rol = Operaciones.consultar(sql);
  
    //declaracion de cabeceras a usar en la tabla HTML
    String[] cabeceras = new String[]{
      "ID Rol",
      "Nombre Rol"
    };
    
    //variable de tipo Tabla para generar la Tabla HTML
    Tabla tab = new Tabla(Rol, //array que contiene los datos
          "50%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    //boton eliminar
    tab.setEliminable(true);
    //boton actualizar
    tab.setModificable(true); 
    //pagina encargada de eliminar
    tab.setPaginaEliminable("Roles_operaciones.jsp");
    //pagina encargada de actualizacion
    tab.setPaginaModificable("Roles.jsp");
    //pagina encargada de seleccion para operaciones
    tab.setPaginaSeleccionable("Roles.jsp");
    //icono para modificar y eliminar
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png"); 
    //columnas seleccionables
    tab.setColumnasSeleccionables(new int[]{1});
    //pie de tabla
    tab.setPie("Resultado Roles");
    
    //imprime la tabla en pantalla
        String tabla01 = tab.getTabla();
        out.println(tabla01);
%>
<%@include file="../_down.jsp"%>
