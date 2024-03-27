<%@page import="procesos.*" %>
<%@page import="entidades.*" %>
<%
    //se capturan la variables del origen para todos los vuelos
    //si ya ha sido seleccionado un origen
    String idproducto = request.getParameter("idproducto");
    String nombre = request.getParameter("nombre");
%>    
<%@include file="../_top.jsp"%>
<script>
function abrirVentana (URL){
    //funcion javascript para abrir un subventana para realizar
    //busquedas, se le pasa la pagina a mostrar como parametro
    window.open(URL,"ventana1","width=700,height=400,scrollbars=YES,statusbar=YES,top=150,left=300")
}
</script>
        <h1>Registro de productos-categorias</h1><br><br>
        <form name="main" method="post" action="cp_operaciones.jsp">
            <input type="hidden" name="sw_nuevo" value="1"/>
            <br>
            Seleccione el producto
            <input type="text" name="txtIdProducto" value="<%=idproducto!=null?idproducto:"" %>" size="3" readonly="readonly">
            <input type="text" name="txtDescripcion" value="<%=nombre!=null?nombre:"" %>" size="50" readonly="readonly">
            <input type="button" class="boton" value="..." onclick="abrirVentana('bproductos.jsp');">                       
            <br><br><br><br>
            <hr>
            <br>
           <!-- Fecha y Hora:   -->         
            <!--<input type="datetime-local" name="txtFecha" size="25"> -->           
            Categoria:  
            <input type="text" name="txtIdCategoria" id="txtIdCategoria" size="2" readonly="readonly">
            <input type="text" name="txtCategoria" id="txtCategoria" readonly="readonly">
            <input type="button" value="..." class="boton" onclick="abrirVentana('bcategorias.jsp');">           
          
            <input type="submit" value="Agregar" class="boton">
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
    String sql = "select cp.id, p.nombre"
            + " from producto p, categoria c, categoria_producto cp"
            + " where p.idproducto = cp.idproducto and c.idcategoria  = cp.idcategoria";
    
    //array que alamcena el resultado de la consulta SQL    
    String[][] categoria =
    Operaciones.consultar(sql);
  
    //cabeceras a mostrar en la tabla
    String[] cabeceras = new String[]{
      "Id",
      "Nombre del Producto"
            
            
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
    tab.setPie("Resultado Categoria-Productos");
    
    //imprime la tabla en pantalla
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
<%@include file="../_down.jsp"%>
