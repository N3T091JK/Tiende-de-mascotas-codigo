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
        <title>empleado</title>
    </head>
    <body>
        <div id="contenido" style="padding: 10px">
        <h1>Listado de empleado</h1>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
      String sql = "SELECT u.idempleado, u.nombres, u.apellidos, u.direccion, p.rol " +
                       "FROM empleado u, rol p " +
                       "WHERE u.idrol = p.idrol";
    
    String[][] empleado=
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Id",
      "Nombres",
      "apellidos",
      "Direccion",
      "Rol"
    };
    Tabla tab = new Tabla(empleado,
          "95%",  
          Tabla.STYLE.TABLE01, 
          Tabla.ALIGN.LEFT,  
          cabeceras); 
   
    tab.setFilaSeleccionable(true);
    tab.setMetodoFilaSeleccionable("_Seleccionar_");
    tab.setPaginaSeleccionable("Ventas.jsp");
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
                       "Ventas.jsp"+"?idempleado="+id_+"&nombres="+descripcion_;
            window.close();
        }       
    </script> 
    </div>
    </body>
</html>
