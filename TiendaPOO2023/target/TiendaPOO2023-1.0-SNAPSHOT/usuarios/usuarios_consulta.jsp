<%@include file="../_top.jsp"%>
<%@page import="procesos.*"%>
<% 
    /*
    String sql = "SELECT idusuario, nombres, apellidos, "
            + "email, telefono, p.nombres, r.rol  "
            + "FROM usuarios u, empleado p, rol r "
            + "WHERE u.idempleado = p.idempleado and r.idrol = u.idrol  ";
    
     String valor1 = request.getParameter("txtBusqueda");
    if (valor1!=null){
        //agrega el filtro a la SQL
        sql += " and nombres like '%"+valor1+"%'";        
    }   
    String sql = "SELECT u.idusuario, nombres, apellidos, "
            + "email, telefono, p.nombres, r.rol  "
            + "FROM usuarios u, empleado p, rol r "
            + "WHERE u.idempleado = p.idempleado and r.idrol = u.idrol  ";
         
     */
    /*String sql = "SELECT * FROM usuarios";*/
   String sql = "SELECT u.idusuario, u.nombres, u.apellidos, u.email, u.telefono, p.nombres as empleado, r.rol " +
                       "FROM usuarios u " +
                       "INNER JOIN empleado p ON u.idempleado = p.idempleado " +
                       "INNER JOIN rol r ON r.idrol = u.idrol";   
    
    
    
    
    String valor1 = request.getParameter("txtBusqueda");
    if (valor1!=null){
        sql += " and (u.idusuario like '%"+valor1+"%' or "
                + " u.nombres like '%"+valor1+"%')";        
    }
    
    
 //consulta SQL para los paises
   
    //obtener valor para usar en filtro de la consulta
   
  

%>
<h1>Listado Usuarios</h1><br>
<script>            
    window.onload = function() {
        document.getElementById("txtBusqueda").focus();
    };
</script>    
<div class="busqueda" style="width: 90%; text-align: right">
    <form action="usuarios_consulta.jsp" method="get">
        <input type="text" name="txtBusqueda" id="txtBusqueda"
               value="<%= valor1!=null?valor1:"" %>" />
        <input type="submit" value="Buscar"/>
    </form>
</div>             
<div class="buttons" >
    <ul>        
        <li><a href="usuarios.jsp">Nuevo</a></li>
        <%-- <li><a href="/TiendaPOO2023/reportes/reporte_usuario.jsp" target="_blank">Ver Reporte</a></li>--%>
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
    String[][] usuarios=
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Usuario",
      "Nombres",
      "Apellidos",
      "Email",
      "Telefono",
      //"Contraseña",
      "Empleados",
      "Rol"
    };
    Tabla tab = new Tabla(usuarios, //array que contiene los datos
          "90%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    tab.setEliminable(true);
    tab.setModificable(true);    
    tab.setPaginaEliminable("usuarios_operaciones.jsp");
    tab.setPaginaModificable("usuarios.jsp");
    tab.setIconoModificable("../iconos/edit.png");
    tab.setIconoEliminable("../iconos/delete.png"); 
    tab.setPaginaSeleccionable("usuarios.jsp");
    tab.setColumnasSeleccionables(new int[]{0});
    tab.setPie("Resultado usuarios");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
%>
<%@include file="../_down.jsp"%>
