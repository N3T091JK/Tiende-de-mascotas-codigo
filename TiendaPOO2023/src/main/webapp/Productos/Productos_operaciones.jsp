<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="procesos.*" %>
<%@ page import="entidades.*" %>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);

    String id = request.getParameter("id");

    if (id != null) {
        // Operación eliminar
        int result = Operaciones.eliminar(new Producto(), id);
        if (result > 0) {
            response.sendRedirect("Productos_consulta.jsp?result=" + Operaciones.OK_ELIMINAR);
        } else {
            response.sendRedirect("Productos_consulta.jsp?result=" + Operaciones.ERROR_ELIMINAR);
        }
    } else if (request.getParameter("sw_nuevo") != null) {
        // Verifica si es un registro nuevo o una actualización
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String idproducto = request.getParameter("txtIdProducto");
        String nombre = request.getParameter("txtNombre");
        String codigo = request.getParameter("txtCodigo");
        String precio = request.getParameter("txtPrecio");
        String existencia = request.getParameter("txtexistencia"); // Corregido el nombre
        String idcategoria = request.getParameter("cmbIdCategoria");

        Producto u = new Producto(
        Integer.parseInt(idcategoria),        
        codigo.toUpperCase(),
        nombre.toUpperCase(),       
        Double.parseDouble(precio),
        Integer.parseInt(existencia)                  
); 
        if (sw_nuevo == 1) {
            // Operación insertar
            int result = Operaciones.insertar(u);
            if (result > 0) {
                response.sendRedirect("Productos_consulta.jsp?result=" + Operaciones.OK_INSERTAR);
            } else {
                response.sendRedirect("Productos_consulta.jsp?result=" + Operaciones.ERROR_INSERTAR);
            }
        } else {
            // Operación actualizar
            int result = Operaciones.actualizar(u, idproducto);
            if (result > 0) {
                response.sendRedirect("Productos_consulta.jsp?result=" + Operaciones.OK_ACTUALIZAR);
            } else {
                response.sendRedirect("Productos_consulta.jsp?result=" + Operaciones.ERROR_ACTUALIZAR);
            }
        }
    } else {
        response.sendRedirect("Productos_consulta.jsp");
    }
%>

