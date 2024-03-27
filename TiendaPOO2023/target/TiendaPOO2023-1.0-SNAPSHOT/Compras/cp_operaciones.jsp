<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    String idcompra = null;    
    if (request.getParameter("idcompra")!=null){
        idcompra = request.getParameter("idcompra");
        HashMap hpCategoriaProd = Operaciones.getRegistro(new Compra(), idcompra);
        String idempleado = hpCategoriaProd.get("idempleado").toString();
        HashMap hpCategoria = Operaciones.getRegistro(new Empleado(), idempleado);
        String nombres= hpCategoria.get("nombres").toString();
        //---------------------------------------------------------       
        int result = Operaciones.eliminar(new Compra(), idcompra);
        if (result>0)
            response.sendRedirect("Compras.jsp?result="+Operaciones.OK_ELIMINAR
                    +"&idempleado="+idempleado+"&nombres="+nombres);
        else
            response.sendRedirect("Compras.jsp?result="+Operaciones.ERROR_ELIMINAR
                    +"&idcliente="+idempleado+"&nombres="+nombres);
    }else if (request.getParameter("sw_nuevo")!=null){
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        int idempleado = Integer.parseInt(request.getParameter("txtidcliente"));
        String nombres = request.getParameter("txtnombres");
        int iddetallescompra = Integer.parseInt(request.getParameter("txtiddetallescompra"));
        
        Compra cp = new Compra(idempleado, iddetallescompra);
        
        if (sw_nuevo==1){
            int result = Operaciones.insertar(cp);
            if (result>0)               
                response.sendRedirect("Compras.jsp?result="+Operaciones.OK_INSERTAR
                        +"&idempleado="+idempleado+"&nombres="+nombres);
            else
                response.sendRedirect("Compras.jsp?result="+Operaciones.ERROR_INSERTAR
                        +"&idempleado="+idempleado+"&nombres="+nombres);
        }else{
            response.sendRedirect("Compras.jsp");
        }
    }else{
        response.sendRedirect("Compras.jsp");
    }
%>
