<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% 
 HttpSession sesion = request.getSession(); 

if (sesion.getAttribute("Usuario")==null){
    response.sendRedirect("/AerolineaProject/index.jsp");
}

response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programación</title>
        <link rel="stylesheet" type="text/css" href="/POO1/css/reset.css" />
        <link rel="stylesheet" type="text/css" href="/POO1/css/main.css" media="screen" />        
        <link rel="stylesheet" type="text/css" href="/POO1/css/tabla.css" media="screen" />                                                   
    </head>
    <body>
        <div id="header">
            <h1>Programación IV</h1><br/>
            <h2>A Example Project for Learning</h2>
            <img src="/POO1/iconos/logo2.png" />
        </div>
        <div id="sesion">            
            <h2>Usuario: <%= sesion.getAttribute("Nombre") %>
            <strong>[<%= sesion.getAttribute("Usuario") %>]</strong> | 
            <a href="/POO1/logout.jsp">Cerrar Sesión</a>
            </h2>   
        </div>        
        <div id="menu">
            <ul>
                <li><a href="/POO1/principal.jsp">Home</a></li>
                <li><a href="/POO1/usuarios/usuarios_consulta.jsp">Usuarios</a></li>
                <li><a href="/POO1/paises/paises_consulta.jsp">Paises</a></li>
                <li><a href="/POO1/Productos/Productos_consulta.jsp">Productos</a></li>
                <li><a href="/POO1/Categorias/Categoria_consulta.jsp">Categoria</a></li>
                <li><a href="/POO1/categorias_productos/categorias_productos.jsp">Categoria-Productos</a></li>
                <li><a href="/POO1/Roles/Roles_consulta.jsp">Roles</a></li>
            </ul>
        </div>
        <div id="content">