<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="procesos.*" %>
<%@ page import="entidades.*" %>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);

    String id = request.getParameter("id");

    if (id != null) {
        // Operación eliminar
        int result = Operaciones.eliminar(new Cliente(), id);
        if (result > 0) {
            response.sendRedirect("Clientes_consulta.jsp?result=" + Operaciones.OK_ELIMINAR);
        } else {
            response.sendRedirect("Clientes_consulta.jsp?result=" + Operaciones.ERROR_ELIMINAR);
        }
    } else if (request.getParameter("sw_nuevo") != null) {
        // Verifica si es un registro nuevo o una actualización
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String IdCliente = request.getParameter("txtIdCliente");
        String Nombres = request.getParameter("txtNombres");
        String Apellidos = request.getParameter("txtApellidos");
        String Direccion = request.getParameter("txtDireccion");
        String correo = request.getParameter("txtcorreo"); // Corregido el nombre
        String Telefono = request.getParameter("txtTelefono");

        Cliente u = new Cliente(   
        Nombres.toUpperCase(),
        Apellidos.toUpperCase(),       
        Direccion.toUpperCase(),
        correo.toUpperCase(),
        Telefono.toUpperCase()       
); 
        if (sw_nuevo == 1) {
            // Operación insertar
            int result = Operaciones.insertar(u);
            if (result > 0) {
                response.sendRedirect("Clientes_consulta.jsp?result=" + Operaciones.OK_INSERTAR);
            } else {
                response.sendRedirect("Clientes_consulta.jsp?result=" + Operaciones.ERROR_INSERTAR);
            }
        } else {
            // Operación actualizar
            int result = Operaciones.actualizar(u, IdCliente);
            if (result > 0) {
                response.sendRedirect("Clientes_consulta.jsp?result=" + Operaciones.OK_ACTUALIZAR);
            } else {
                response.sendRedirect("Clientes_consulta.jsp?result=" + Operaciones.ERROR_ACTUALIZAR);
            }
        }
    } else {
        response.sendRedirect("Clientes_consulta.jsp");
    }
%>

