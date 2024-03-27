<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="procesos.*" %>
<%@ page import="entidades.*" %>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);

    String id = request.getParameter("id");

    if (id != null) {
        // Operación eliminar
        int result = Operaciones.eliminar(new DetallesVenta(), id);
        if (result > 0) {
            response.sendRedirect("DetallesVentas_consulta.jsp?result=" + Operaciones.OK_ELIMINAR);
        } else {
            response.sendRedirect("DetallesVentas_consulta.jsp?result=" + Operaciones.ERROR_ELIMINAR);
        }
    } else if (request.getParameter("sw_nuevo") != null) {
        // Verifica si es un registro nuevo o una actualización
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String idDetalleventas = request.getParameter("txtIdDetallesVentas");
        String preciounitario = request.getParameter("txtPrecio");
        String cantidad = request.getParameter("txtcantidad");
        String subtotal = request.getParameter("txtTotal"); // Corregido el nombre
        String idproducto = request.getParameter("cmbIdProducto");

        DetallesVenta u = new DetallesVenta(
        Integer.parseInt(idproducto),                 
        Double.parseDouble(preciounitario),
        Integer.parseInt(cantidad),       
        Double.parseDouble(subtotal)       
                      
); 
        if (sw_nuevo == 1) {
            // Operación insertar
            int result = Operaciones.insertar(u);
            if (result > 0) {
                response.sendRedirect("DetallesVentas_consulta.jsp?result=" + Operaciones.OK_INSERTAR);
            } else {
                response.sendRedirect("DetallesVentas_consulta.jsp?result=" + Operaciones.ERROR_INSERTAR);
            }
        } else {
            // Operación actualizar
            int result = Operaciones.actualizar(u, idDetalleventas);
            if (result > 0) {
                response.sendRedirect("DetallesVentas_consulta.jsp?result=" + Operaciones.OK_ACTUALIZAR);
            } else {
                response.sendRedirect("DetallesVentas_consulta.jsp?result=" + Operaciones.ERROR_ACTUALIZAR);
            }
        }
    } else {
        response.sendRedirect("DetallesVentas_consulta.jsp");
    }
%>