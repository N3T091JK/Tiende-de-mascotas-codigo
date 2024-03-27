<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda star pet</title>
    <!--<link rel="stylesheet" href="style.css">-->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="wrapper">
        <h1>Login</h1>
        <%
        String Mensaje[] = new String[3];
        Mensaje[0] = "Ha introducido usuario o contraseña Incorrecta!!!<br>";
        Mensaje[1] = "Ha ocurrido un error en la conexion, Intente de nuevo<br>";
        String Error = request.getParameter("error");

        if (Error != null)
            out.println("<center><font color='white' size='4'>" + Mensaje[Integer.parseInt(Error)] + "</font><br></center><br>");
        %>
        <form name="main" action="login.jsp" method="POST">
            <table class="login">
                <div class="input-box">
                    <input type="text" name="txtUsuario" placeholder="Nombre Usuario" size="30px" required/>
                </div>
                <div class="input-box">
                    <input type="password" name="txtClave" placeholder="contraseña" size="30px" required/>
                </div>
                <!--  <div class="remember-forgot">
                    <label><input type="checkbox"> remember me</label>
                </div> -->
                <div class="buttons">
                    <input type="submit" value="Entrar" name="btnEntrar" class="btn">
                </div>
            </table>
        </form>
    </div>
</body>
</html>