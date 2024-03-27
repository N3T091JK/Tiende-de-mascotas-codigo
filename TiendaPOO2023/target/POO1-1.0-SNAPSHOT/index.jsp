<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programación IV - Project</title>
        <link rel="stylesheet" type="text/css" href="css/reset.css" />
        <link rel="stylesheet" type="text/css" href="css/main.css" media="screen" />
        <style type="text/css">
            .login {margin: 0 auto}
            .login td{padding:5px 0px}
            #header >h1{margin-left: 0px;padding-top: 110px;} 
            #content >h1{text-align: center}            
        </style>
    </head>
    <body>        
    <div id="header">        
        <h1>Programación IV</h1>
    </div>
        
<div id="content">
    <hr/>
        <h1>Inicio de Sesión</h1><br/>
<%        
String Mensaje[] = new String[3];
Mensaje[0] = "Ha introducido usuario o contraseña Incorrecta!!!<br>";
Mensaje[1] = "Ha ocurrido un error en la conexion, Intente de nuevo<br>";
String Error = request.getParameter("error");

if (Error!=null)
    out.println("<center><font color='red' size='2'>"+Mensaje[Integer.parseInt(Error)]+"</font><br></center><br>");
%>        
        <form name="main" action="login.jsp" method="POST">
            <table class="login">
                <tr><td>Usuario</td></tr>
                <tr><td><input type="text" name="txtUsuario" size="30px"/></td></tr>
                <tr><td>Contraseña</td></tr>
                <tr><td><input type="password" name="txtClave" size="30px"/></td></tr>
            <tr><td>
            <div class="buttons">
                <ul>
                    <li><input type="submit" value="Entrar" name="btnEntrar"/></li>                
                </ul>
            </div>  
            </td></tr>
            </table>
        </form>
        <br/><br/><br/><br/>
       <hr/> 
</div>
        
        
       
