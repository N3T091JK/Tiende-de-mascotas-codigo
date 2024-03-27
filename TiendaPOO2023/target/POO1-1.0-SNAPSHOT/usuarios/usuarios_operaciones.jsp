<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    
    //Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);

    String id = null;    
    
    //operacion eliminar
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        int result = Operaciones.eliminar(new Usuarios(), id);
        if (result>0)
            response.sendRedirect("usuarios_consulta.jsp?result="+Operaciones.OK_ELIMINAR);
        else
            response.sendRedirect("usuarios_consulta.jsp?result="+Operaciones.ERROR_ELIMINAR);
    
    // verifica si es registro nuevo
    }else if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String idusuario = request.getParameter("txtIdusuario");
        String nombres = request.getParameter("txtNombres");
        String apellidos = request.getParameter("txtApellidos");
        String telefono = request.getParameter("txtTelefono");
        String email = request.getParameter("txtEmail");
        String clave = request.getParameter("txtClave");        
        String idrol = request.getParameter("cmbIdrol");
        String idpais = request.getParameter("cmbIdpais");
        
        
        Usuarios u = new Usuarios(idusuario, 
                nombres.toUpperCase(), //string
                apellidos.toUpperCase(), 
                email, 
                telefono, 
                Usuarios.getHash(clave),//contrasena 
                Integer.parseInt(idrol), //para las llaves foraneas
                Integer.parseInt(idpais));
        
        if (sw_nuevo==1){
            int result = Operaciones.insertar(u);
            if (result>0)
                response.sendRedirect("usuarios_consulta.jsp?result="+Operaciones.OK_INSERTAR);
            else
                response.sendRedirect("usuarios_consulta.jsp?result="+Operaciones.ERROR_INSERTAR);
        }else{
            //operacion actualizar
            String cambiar = request.getParameter("chkClave");
            if (cambiar==null)                
                u.setClave(clave);
            
            int result = Operaciones.actualizar(u, idusuario);
            if (result>0)
                response.sendRedirect("usuarios_consulta.jsp?result="+Operaciones.OK_ACTUALIZAR);
            else
                response.sendRedirect("usuarios_consulta.jsp?result="+Operaciones.ERROR_ACTUALIZAR);
        }
    }else{
        response.sendRedirect("usuarios_consulta.jsp");
    }
%>
