<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/reset.css"/>
        <link rel="stylesheet" href="../css/main.css"/>
        <link rel="stylesheet" href="../css/tabla.css"/>
        <style>
            #table01 td{ padding-top: 8px; cursor: pointer}
        </style>
        <title>Productos</title>
    </head>
    <body>
        <div id="contenido" style="padding: 10px">
        <h1>Listado de Productos</h1>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
        String sql = "select idproducto, categoria, descripción, costo, precio, stock "            
            + " from producto a, categoria p"
            + " where a.idcategoria = p.idcategoria";
    
    String[][] productos=
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "IdProducto",
      "Descripcion",
      "Costo",
      "Precio",
      "Stock",
      "Categoria"
    };
    Tabla tab = new Tabla(productos,
          "95%",  
          Tabla.STYLE.TABLE01, 
          Tabla.ALIGN.LEFT,  
          cabeceras); 
   
    tab.setFilaSeleccionable(true);
    tab.setMetodoFilaSeleccionable("_Seleccionar_");
    tab.setPaginaSeleccionable("categorias_productos.jsp");
    tab.setColumnasSeleccionables(new int[]{0,1});
    tab.setPie("Resultado de la busqueda");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
    
    <script>
        function _Seleccionar_(row){               
            id_ = row.cells[0].childNodes[0].innerHTML;
            descripcion_ = row.cells[1].childNodes[0].innerHTML;
            window.opener.location.href=
                       "categorias_productos.jsp"+"?idproducto="+id_+"&descripción="+descripcion_;
            window.close();
        }       
    </script> 
    </div>
    </body>
</html>