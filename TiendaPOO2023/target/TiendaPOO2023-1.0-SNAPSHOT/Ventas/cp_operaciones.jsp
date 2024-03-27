<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    String idventa = null;    
    if (request.getParameter("idventa")!=null){
        idventa = request.getParameter("idventa");
        HashMap hpCategoriaProd = Operaciones.getRegistro(new Venta(), idventa);
        String idempleado = hpCategoriaProd.get("idempleado").toString();
        HashMap hpCategoria = Operaciones.getRegistro(new Empleado(), idempleado);
        String nombres= hpCategoria.get("nombres").toString();
        //---------------------------------------------------------       
        int result = Operaciones.eliminar(new Venta(), idventa);
        if (result>0)
            response.sendRedirect("Ventas.jsp?result="+Operaciones.OK_ELIMINAR
                    +"&idempleado="+idempleado+"&nombres="+nombres);
        else
            response.sendRedirect("Ventas.jsp?result="+Operaciones.ERROR_ELIMINAR
                    +"&idempleado="+idempleado+"&nombres="+nombres);
    }else if (request.getParameter("sw_nuevo")!=null){
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        int idempleado = Integer.parseInt(request.getParameter("txtidcliente"));
        String nombres = request.getParameter("txtnombres");
        int iddetalleventa = Integer.parseInt(request.getParameter("txtiddetalleventa"));
        
        Venta cp = new Venta(idempleado, iddetalleventa);
        
        if (sw_nuevo==1){
            int result = Operaciones.insertar(cp);
            if (result>0)               
                response.sendRedirect("Ventas.jsp?result="+Operaciones.OK_INSERTAR
                        +"&idempleado="+idempleado+"&nombres="+nombres);
            else
                response.sendRedirect("Ventas.jsp?result="+Operaciones.ERROR_INSERTAR
                        +"&idcliente="+idempleado+"&nombres="+nombres);
        }else{
            response.sendRedirect("Ventas.jsp");
        }
    }else{
        response.sendRedirect("Ventas.jsp");
    }
%>

