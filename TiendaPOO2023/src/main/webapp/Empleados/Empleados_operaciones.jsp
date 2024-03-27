<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="procesos.*" %>
<%@ page import="entidades.*" %>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);

    String id = request.getParameter("id");

    if (id != null) {
        // Operación eliminar
        int result = Operaciones.eliminar(new Empleado(), id);
        if (result > 0) {
            response.sendRedirect("Empleados_consulta.jsp?result=" + Operaciones.OK_ELIMINAR);
        } else {
            response.sendRedirect("Empleados_consulta.jsp?result=" + Operaciones.ERROR_ELIMINAR);
        }
    } else if (request.getParameter("sw_nuevo") != null) {
        // Verifica si es un registro nuevo o una actualización
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String IdEmpleado = request.getParameter("txtIdEmpleado");
        String nombres = request.getParameter("txtnombres");
        String apellidos = request.getParameter("txtapellidos");
        String Direccion = request.getParameter("txtDireccion");
        String idRol = request.getParameter("cmbidRol");


        Empleado u = new Empleado(
        Integer.parseInt(idRol),        
        nombres.toUpperCase(),
        apellidos.toUpperCase(),
        Direccion.toUpperCase()
       
               
); 
        if (sw_nuevo == 1) {
            // Operación insertar
            int result = Operaciones.insertar(u);
            if (result > 0) {
                response.sendRedirect("Empleados_consulta.jsp?result=" + Operaciones.OK_INSERTAR);
            } else {
                response.sendRedirect("Empleados_consulta.jsp?result=" + Operaciones.ERROR_INSERTAR);
            }
        } else {
            // Operación actualizar
            int result = Operaciones.actualizar(u, IdEmpleado);
            if (result > 0) {
                response.sendRedirect("Empleados_consulta.jsp?result=" + Operaciones.OK_ACTUALIZAR);
            } else {
                response.sendRedirect("Empleados_consulta.jsp?result=" + Operaciones.ERROR_ACTUALIZAR);
            }
        }
    } else {
        response.sendRedirect("Empleados_consulta.jsp");
    }
%>

