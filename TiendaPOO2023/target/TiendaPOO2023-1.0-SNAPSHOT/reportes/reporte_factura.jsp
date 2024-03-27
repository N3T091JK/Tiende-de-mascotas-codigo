
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<!-- importamos las librerías de JasperReports-->
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@page import="procesos.ConexionBD"%>
<%@page import="procesos.*"%>
<%
 //Creamos la conexion
 String valor1 = request.getParameter("valor1");
 Conexion cn = new ConexionBD();
 cn.conectar();
 Connection conexion=cn.getConexion();
 //obtenemos el reporte (archivo .jasper) en un archivo de tipo file
 File reportFile = new File(application.getRealPath("/reportes/Factura.jasper"));

 //configuramos los parametros en una varible de tipo Map
 //que como un array
 Map parameters = new HashMap();
 parameters.put("origen", "49");
 //parameters.put("filtro", "WHERE idcategoria = 1");

 //para agregar mas parametro solo llame el metodo put() varias veces
 byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),parameters,conexion);
 response.setContentType("application/pdf");

 //para que el pdf se pueda ver en microsoft explorer
 //response.setHeader("Cache-Control", "cache");

 //para que aparezca el diálogo abrir/guardar
 //response.setHeader("Content-Disposition", "attachment; filename=reporte.pdf");

 response.setHeader("Content-Disposition", "inline; filename=reporte_factura.pdf");
 response.setContentLength(bytes.length);
 ServletOutputStream ouputStream = response.getOutputStream();
 ouputStream.write(bytes, 0, bytes.length);
 ouputStream.flush();
 ouputStream.close();

%>