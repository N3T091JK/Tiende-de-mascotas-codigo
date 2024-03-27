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
        String sql = "SELECT * FROM cliente ";
    
    String[][] productos=
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "idcliente",
      "nombres",
      "apellidos",
      "direccion",
      "correo",
      "telefono"
    };
    Tabla tab = new Tabla(productos,
          "95%",  
          Tabla.STYLE.TABLE01, 
          Tabla.ALIGN.LEFT,  
          cabeceras); 
   
    tab.setFilaSeleccionable(true);
    tab.setMetodoFilaSeleccionable("_Seleccionar_");
    tab.setPaginaSeleccionable("Compras.jsp");
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
                       "Compras.jsp"+"?idcliente="+id_+"&nombres="+descripcion_;
            window.close();
        }       
    </script> 
    </div>
    </body>
</html>