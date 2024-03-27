<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);

    //variable para manejar el ID en una eliminacion
    String id = null;    
    
    //operacion eliminar
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        int result = Operaciones.eliminar(new Rol(), id);
        if (result>0)
            //redirecciona y envia el codigo del mensaje
            response.sendRedirect("Roles_consulta.jsp?result="+Operaciones.OK_ELIMINAR);
        else
            response.sendRedirect("Roles_consulta.jsp?result="+Operaciones.ERROR_ELIMINAR);
    
    // verifica si es registro nuevo
    }else if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String rol = request.getParameter("txtrol").toUpperCase();
        String idrol = request.getParameter("txtIdrol");
        Rol p = new Rol(        
        rol
        
        );
        
        
        if (sw_nuevo==1){
            int result = Operaciones.insertar(p);
            if (result>0)
                response.sendRedirect("Roles_consulta.jsp?result="+Operaciones.OK_INSERTAR);
            else
                response.sendRedirect("Roles_consulta.jsp?result="+Operaciones.ERROR_INSERTAR);
        }else{
            //operacion actualizar
            int result = Operaciones.actualizar(p, idrol);
            if (result>0)
                response.sendRedirect("Roles_consulta.jsp?result="+Operaciones.OK_ACTUALIZAR);
            else
                response.sendRedirect("Roles_consulta.jsp?result="+Operaciones.ERROR_ACTUALIZAR);
        }
    }else{
        response.sendRedirect("Roles_consulta.jsp");
    }
%>

