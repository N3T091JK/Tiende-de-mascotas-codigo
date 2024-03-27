
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
        <title>DetalleFactura</title>
    </head>
    <body>
        <div id="contenido" style="padding: 10px">
        <h1>Categorias de DetalleFactura</h1>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
   String sql = "SELECT u.iddetallefactura, p.nombre AS producto, u.precio, u.cantidad, u.total, v.nombres AS empleado "
            + "FROM detallefactura u, producto p, empleado v "
            + "WHERE u.idproducto = p.idproducto AND u.idempleado = v.idempleado";

    String[][] DetalleFactura=
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "id DetalleFactura",
      "Producto",
      "PrecioUnitario",
      "cantidad",
      "subtotal",
      "Empleado"
            
    };
    Tabla tab = new Tabla(DetalleFactura, 
          "95%", 
          Tabla.STYLE.TABLE01,
          Tabla.ALIGN.LEFT, 
          cabeceras); 
   
    tab.setFilaSeleccionable(true);
    tab.setMetodoFilaSeleccionable("_Seleccionar_");
    tab.setPaginaSeleccionable("");
    tab.setColumnasSeleccionables(new int[]{0,1,2,3,4});
    tab.setPie("Resultado de la busqueda");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
    
    <script>
        //funcion javascript que se ejecuta al hacer click en una fila
        //recibe un elemento de tipo fila como parametro: row
        function _Seleccionar_(row){    
            
            id_ = row.cells[0].childNodes[0].innerHTML;
            idproducto_ = row.cells[1].childNodes[0].innerHTML;
            PrecioUnitario_ = row.cells[2].childNodes[0].innerHTML;
            cantidad_ = row.cells[3].childNodes[0].innerHTML;
            subtotal_ = row.cells[4].childNodes[0].innerHTML;
            window.opener.document.getElementById("txtidfactura").value=id_;
            window.opener.document.getElementById("txtidproducto").value=idproducto_;
            window.opener.document.getElementById("txtprecio").value=PrecioUnitario_;
            window.opener.document.getElementById("txtcantidad").value=cantidad_;
            window.opener.document.getElementById("txttotal").value=subtotal_;
            //cierra la ventana
            window.close();
        }       
    </script> 
    </div>
    </body>
</html>