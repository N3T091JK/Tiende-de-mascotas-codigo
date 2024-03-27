<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    
    HttpSession sesion = request.getSession();
    sesion.removeAttribute("Usuario");
    sesion.removeAttribute("Nombre");
    sesion.removeAttribute("Rol");
    sesion.invalidate();
    response.sendRedirect("index.jsp");
%>
