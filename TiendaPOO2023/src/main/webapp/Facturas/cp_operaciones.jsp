<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    String idfactura = null;    
    if (request.getParameter("idfactura")!=null){
        idfactura = request.getParameter("idfactura");
        HashMap hpCategoriaProd = Operaciones.getRegistro(new Factura(), idfactura);
        String idcliente = hpCategoriaProd.get("idcliente").toString();
        HashMap hpCategoria = Operaciones.getRegistro(new Cliente(), idcliente);
        String nombres= hpCategoria.get("nombres").toString();
        //---------------------------------------------------------       
        int result = Operaciones.eliminar(new Factura(), idfactura);
        if (result>0)
            response.sendRedirect("Facturas.jsp?result="+Operaciones.OK_ELIMINAR
                    +"&idcliente="+idcliente+"&nombres="+nombres);
        else
            response.sendRedirect("Facturas.jsp?result="+Operaciones.ERROR_ELIMINAR
                    +"&idcliente="+idcliente+"&nombres="+nombres);
    }else if (request.getParameter("sw_nuevo")!=null){
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        int idcliente = Integer.parseInt(request.getParameter("txtidcliente"));
        String nombres = request.getParameter("txtnombres");
        int iddetallefactura = Integer.parseInt(request.getParameter("txtidfactura"));
        
        Factura cp = new Factura(idcliente, iddetallefactura);
        
        if (sw_nuevo==1){
            int result = Operaciones.insertar(cp);
            if (result>0)               
                response.sendRedirect("Facturas.jsp?result="+Operaciones.OK_INSERTAR
                        +"&idcliente="+idcliente+"&nombres="+nombres);
            else
                response.sendRedirect("Facturas.jsp?result="+Operaciones.ERROR_INSERTAR
                        +"&idcliente="+idcliente+"&nombres="+nombres);
        }else{
            response.sendRedirect("Facturas.jsp");
        }
    }else{
        response.sendRedirect("Facturas.jsp");
    }
%>