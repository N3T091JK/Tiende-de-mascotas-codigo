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
        <title>Categorias</title>
    </head>
    <body>
        <div id="contenido" style="padding: 10px">
        <h1>Categorias de Productos</h1>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    String sql = "select *  "            
            + " from categoria";
    
    String[][] categorias=
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "IdCategoria",
      "Categoria"
    };
    Tabla tab = new Tabla(categorias, 
          "95%", 
          Tabla.STYLE.TABLE01,
          Tabla.ALIGN.LEFT, 
          cabeceras); 
   
    tab.setFilaSeleccionable(true);
    tab.setMetodoFilaSeleccionable("_Seleccionar_");
    tab.setPaginaSeleccionable("");
    tab.setColumnasSeleccionables(new int[]{0,1,2,3});
    tab.setPie("Resultado de la busqueda");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
    
    <script>
        //funcion javascript que se ejecuta al hacer click en una fila
        //recibe un elemento de tipo fila como parametro: row
        function _Seleccionar_(row){               
            //recupera el idavion de la fila, en la celda 0
            id1_ = row.cells[0].childNodes[0].innerHTML;
            //recupera descripcion del avion de la fila, en la celda 1
            descripcion1_ = row.cells[1].childNodes[0].innerHTML;
            //asigna a las cajas de texto de la ventana padre los valores
            //obtenidos
            window.opener.document.getElementById("txtIdCategoria").value=id1_;
            window.opener.document.getElementById("txtCategoria").value=descripcion1_;
            //cierra la ventana
            window.close();
        }       
    </script> 
    </div>
    </body>
</html>