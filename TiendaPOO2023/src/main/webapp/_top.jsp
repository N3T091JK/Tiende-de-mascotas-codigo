<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% 
 HttpSession sesion = request.getSession(); 

if (sesion.getAttribute("Usuario")==null){
    response.sendRedirect("/Prueba/index.jsp");
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
   <%-- <link rel="stylesheet" type="text/css" href="Prueba/css/Disen.css" />--%>
      <style>
        
         table {
            width: 50%;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: calc(25% - 10px); /* Ajusta el ancho según tu necesidad */
            padding: 5px;
        }
        
          table2 {
            width: 50%;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: calc(50% - 10px); /* Ajusta el ancho según tu necesidad */
            padding: 5px;
        }


        .buttons {
            margin-top: 20px;
            text-align: left;
        }

        .buttons ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .buttons ul li {
            display: inline;
            margin-right: 10px;
        }

        .buttons input[type="submit"],
        .buttons a {
            padding: 10px;
            background-color: #3498db; /* Color de fondo para el botón */
            color: #fff; /* Color del texto para el botón */
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .buttons a:hover {
            background-color: #2980b9; /* Cambia el color de fondo al pasar el mouse sobre el botón */
        }
        
          .buttons2 {
            margin-top: 20px;
            text-align: center;
        }

        .buttons2 ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .buttons2 ul li {
            display: inline;
            margin-right: 10px;
        }

        .buttons2 input[type="submit"],
        .buttons2 a {
            padding: 10px;
            background-color: #3498db; /* Color de fondo para el botón */
            color: #fff; /* Color del texto para el botón */
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .buttons2 a:hover {
            background-color: #2980b9; /* Cambia el color de fondo al pasar el mouse sobre el botón */
        }
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            /*background-image: url("ruta_de_la_imagen_de_fondo.jpg");*/
            background-size: cover;
            font-size: 14px; /* Ajusta el tamaño de la fuente principal */
        }

        #header {
            background-color: #F2F2F2;
            padding: 15px;
            text-align: center;
        }
        
        #header {
    display: flex;
    align-items: center;
    flex-direction: column; /* Cambia la dirección del eje principal a columna */
    text-align: center; /* Alinea el texto al centro */
}


#header h1 {
    margin-bottom: 15px; /* Ajusta el espacio entre el título y el segundo encabezado según tu necesidad */
}

#header img {
    max-width: 200px;
    height: auto;
    <%--margin-left: 570px;
    margin: 0px 0;--%>
     margin: 1px 0;
}

        h1 {
            margin: 1px;
            font-size: 15px;
            font-size: 1.5em
        }
        h2 {
            margin: 1px 0;
            font-size: 15px;
        }
        img {
            max-width: 50px;
            height: auto;
            margin-right: auto;
        }
        #sesion {
            background-color: #E6E6E6;
            padding: 1px 2px;
            text-align: right;
        }
       #menu {
    background-color: #E6E6E6; /* Cambia el color de fondo del menú */
    padding: 25px;
    text-align: left;
    margin-top: 25px;
}


#menu a {
    display: inline-block; /* Muestra los elementos en una sola línea */
    text-decoration: none;
    color: #333; /* Cambia el color del texto del menú */
    padding: 10px 5px;
    margin: 1px;
    border-radius: 10px;
    transition: background-color 0.3s ease;
}

#menu a:hover {
    background-color: #555; /* Cambia este color al pasar el ratón sobre los elementos del menú */
}

#menu a {
    vertical-align: middle;
}

/* Opcional: Puedes ajustar el margen según tus preferencias */
#menu a:first-child {
    margin-left: 0;
}

#menu a:last-child {
    margin-right: 0;
}
        
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        li {
            display: inline-block;
            margin-right: 5px;
        }
        a {
            text-decoration: none;
            color: #333;
            padding: 5px 5px;
            font-size: 14px;
            text-align: right;
        }
        #content {
            padding: 25px;
            text-align: center;
            margin-top: 10px;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            margin: 5px;
            width: 50%; /* Ajusta el ancho según tus preferencias */
           margin-left: auto;
           margin-right: auto;

        }
        th, td {
            padding: 5px;
            border: 1px solid #fff;
        }
        th {
            background-color: #F2F2F2;
        }
        #footer {
    text-align: center; /* Centrar el contenido del pie de página */
    font-size: 12px; /* Establecer un tamaño de fuente más pequeño */
}

#footer p {
    margin: 5px 0; /* Añadir un pequeño margen alrededor de los párrafos */
}

#footer a {
    text-decoration: none;
    color: steelblue;
}
#sesion1 {
   background-color: #E6E6E6;
    color: #000;
    padding: 9px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 10px;
    right: 10px;
}

#sesion1 h2 {
    margin: 0;
}


    </style>
</head>
<body>
    <div id="header">
        <h1>Tienda star pet</h1>
        <h2>"¡Bienvenido a nuestra tienda online, donde la felicidad de tus peludos amigos está a solo un clic de distancia!"</h2>
         <img src="/TiendaPOO2023/Imagenes/LOGO2.png" />
      
    </div>
    <div id="sesion1">
        <h2>Usuario: <%= sesion.getAttribute("Nombre") %>
            <strong>[<%= sesion.getAttribute("Usuario") %>]</strong> | 
            <a href="/TiendaPOO2023/logout.jsp">Cerrar Sesión</a>
        </h2>
    </div>
    <div id="menu">
        <ul>
           <li><a href="/TiendaPOO2023/principal.jsp">Home</a></li>
                <li><a href="/TiendaPOO2023/usuarios/usuarios_consulta.jsp">Usuarios</a></li>
                <li><a href="/TiendaPOO2023/Roles/Roles_consulta.jsp">Roles</a></li>
                <li><a href="/TiendaPOO2023/Categorias/Categoria_consulta.jsp">Categoria</a></li>
                <li><a href="/TiendaPOO2023/Productos/Productos_consulta.jsp">Productos</a></li>
                <li><a href="/TiendaPOO2023/Empleados/Empleados_consulta.jsp">Empleado</a></li>
                <li><a href="/TiendaPOO2023/Clientes/Clientes_consulta.jsp">Cliente</a></li>
                <li><a href="/TiendaPOO2023/Inventarios/Inventarios_consulta.jsp">Inventario</a></li>
                <li><a href="/TiendaPOO2023/Facturas/Facturas.jsp">Factura</a></li>
                 <li><a href="/TiendaPOO2023/DetalleFacturas/DetalleFacturas_consulta.jsp">DetalleFacturas</a></li>
                <li><a href="/TiendaPOO2023/Compras/Compras.jsp">Compra</a></li>
                <li><a href="/TiendaPOO2023/DetallesCompras/DetallesCompras_consulta.jsp">DetallesCompras</a></li>
                <li><a href="/TiendaPOO2023/Ventas/Ventas.jsp">Venta</a></li>
                <li><a href="/TiendaPOO2023/categorias_productos/categorias_productos.jsp">categorias_productos</a></li>
                <li><a href="/TiendaPOO2023/DetallesVentas/DetallesVentas_consulta.jsp">DetallesVentas</a></li>
        </ul>
    </div>
    <div id="content">
      