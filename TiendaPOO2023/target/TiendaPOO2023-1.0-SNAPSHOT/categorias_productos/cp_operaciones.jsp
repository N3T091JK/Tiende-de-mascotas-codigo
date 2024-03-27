<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    String id = null;    
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        HashMap hpCategoriaProd = Operaciones.getRegistro(new Categoria_producto(), id);
        String idproducto = hpCategoriaProd.get("idproducto").toString();
        HashMap hpCategoria = Operaciones.getRegistro(new Producto(), idproducto);
        String nombre= hpCategoria.get("nombre").toString();
        //---------------------------------------------------------       
        int result = Operaciones.eliminar(new Categoria_producto(), id);
        if (result>0)
            response.sendRedirect("categorias_productos.jsp?result="+Operaciones.OK_ELIMINAR
                    +"&idproducto="+idproducto+"&nombre="+nombre);
        else
            response.sendRedirect("categorias_productos.jsp?result="+Operaciones.ERROR_ELIMINAR
                    +"&idproducto="+idproducto+"&nombre="+nombre);
    }else if (request.getParameter("sw_nuevo")!=null){
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        int idproducto = Integer.parseInt(request.getParameter("txtIdProducto"));
        String nombre = request.getParameter("txtDescripcion");
        int idcategoria = Integer.parseInt(request.getParameter("txtIdCategoria"));
        
        Categoria_producto cp = new Categoria_producto(idcategoria,idproducto);
        
        if (sw_nuevo==1){
            int result = Operaciones.insertar(cp);
            if (result>0)               
                response.sendRedirect("categorias_productos.jsp?result="+Operaciones.OK_INSERTAR
                        +"&idproducto="+idproducto+"&nombre="+nombre);
            else
                response.sendRedirect("categorias_productos.jsp?result="+Operaciones.ERROR_INSERTAR
                        +"&idproducto="+idproducto+"&nombre="+nombre);
        }else{
            response.sendRedirect("categorias_productos.jsp");
        }
    }else{
        response.sendRedirect("categorias_productos.jsp");
    }
%>
