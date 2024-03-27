<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="procesos.*" %>
<%@ page import="entidades.*" %>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);

    String id = request.getParameter("id");

    if (id != null) {
        // Operación eliminar
        int result = Operaciones.eliminar(new Inventario(), id);
        if (result > 0) {
            response.sendRedirect("Inventarios_consulta.jsp?result=" + Operaciones.OK_ELIMINAR);
        } else {
            response.sendRedirect("Inventarios_consulta.jsp?result=" + Operaciones.ERROR_ELIMINAR);
        }
    } else if (request.getParameter("sw_nuevo") != null) {
        // Verifica si es un registro nuevo o una actualización
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String IdInventario = request.getParameter("txtIdInventario");
        String Cantidad = request.getParameter("txtCantidad"); // Corregido el nombre
        String IdProducto = request.getParameter("cmbIdProductos");

        Inventario u = new Inventario(
        Integer.parseInt(IdProducto),        
        Integer.parseInt(Cantidad)                  
); 
        if (sw_nuevo == 1) {
            // Operación insertar
            int result = Operaciones.insertar(u);
            if (result > 0) {
                response.sendRedirect("Inventarios_consulta.jsp?result=" + Operaciones.OK_INSERTAR);
            } else {
                response.sendRedirect("Inventarios_consulta.jsp?result=" + Operaciones.ERROR_INSERTAR);
            }
        } else {
            // Operación actualizar
            int result = Operaciones.actualizar(u, IdInventario);
            if (result > 0) {
                response.sendRedirect("Inventarios_consulta.jsp?result=" + Operaciones.OK_ACTUALIZAR);
            } else {
                response.sendRedirect("Inventarios_consulta.jsp?result=" + Operaciones.ERROR_ACTUALIZAR);
            }
        }
    } else {
        response.sendRedirect("Inventarios_consulta.jsp");
    }
%>
