<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
    // Conexion conn = new ConexionPool();
    Conexion conn = new ConexionBD();
    Operaciones.setConexion(conn);
    HashMap usuarios;
    String empleado[][];
    String rol[][];
    String id = null;
    int sw_nuevo;

    if (request.getParameter("id") != null) {
        id = request.getParameter("id");
        usuarios = Operaciones.getRegistro(new Usuarios(), id);
        sw_nuevo = 0;
    } else {
        sw_nuevo = 1;
        usuarios = null;
    }

    empleado = Operaciones.consultar("select idempleado,nombres from empleado");
    // roles = Operaciones.consultar("select * from rol where idrol = 1");
    rol = Operaciones.consultar("select * from rol");
%>
<%@include file="../_top.jsp"%>
<h1>Usuarios</h1>
<br/>
<form name="form_usuarios" onsubmit="return validar();" action="usuarios_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table2">
        <thead>
            <tr>
                <th colspan="">Complete la información<br><br></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Usuario</td>
                <td><input type="text" name="txtIdusuario" id="txtIdusuario" value="<%= usuarios != null ? usuarios.get("idusuario") : "" %>" <%= sw_nuevo == 0 ? "readonly='readonly'" : "" %> /></td>
            </tr>
            <tr>
                <td>Nombres</td>
                <td><input type="text" name="txtNombres" id="txtNombres" value="<%= usuarios != null ? usuarios.get("nombres") : "" %>" size="30" /></td>
            </tr>
            <tr>
                <td>Apellidos</td>
                <td><input type="text" name="txtApellidos" id="txtApellidos" value="<%= usuarios != null ? usuarios.get("apellidos") : "" %>" size="30" /></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="txtEmail" id="txtEmail" value="<%= usuarios != null ? usuarios.get("email") : "" %>" size="40" /></td>
            </tr>
            <tr>
                <td>Telefono</td>
                <td><input type="text" name="txtTelefono" id="txtTelefono" value="<%= usuarios != null ? usuarios.get("telefono") : "" %>" /></td>
            </tr>
            <% if (usuarios != null) { %>
            <tr>
                <td colspan="2" style="font-weight: bolder">Cambiar clave
                    <input type="checkbox" name="chkClave" id="chkClave" value="1" onchange="cambiar()" />
                    <input type="hidden" name="old_clave" id="old_clave" value="<%= usuarios.get("clave") %>" />
                </td>
            </tr>
            <% } %>
            <tr>
                <td>Contraseña</td>
                <td><input type="password" name="txtClave" id="txtClave" value="<%= usuarios != null ? usuarios.get("clave") : "" %>" /></td>
            </tr>
            <tr>
                <td>Confirmar Contraseña</td>
                <td><input type="password" name="txtConfirmar" id="txtConfirmar" value="<%= usuarios != null ? usuarios.get("clave") : "" %>" /></td>
            </tr>
            <tr>
                <td>empleado</td>
                <td>
                    <select name="cmbIdempleado" id="cmbIdempleado">                    
                        <% for (int i = 0; i < empleado[0].length; i++) { %>
                        <option value="<%= empleado[0][i] %>" <% if (usuarios != null) if (empleado[0][i]==usuarios.get("idempleado")) out.println("selected"); %>>
                            <%= empleado[1][i] %>
                        </option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Rol</td>
                <td>
                    <select name="cmbIdrol" id="cmbIdrol">
                        <% for (int i = 0; i < rol[0].length; i++) { %>
                        <option value="<%= rol[0][i] %>" <% if (usuarios != null) if (rol[0][i] == usuarios.get("idrol")) out.println("selected"); %>>
                            <%= rol[1][i] %>
                        </option>
                        <% } %>
                    </select>
                </td>
            </tr>
        </tbody>
    </table>
    <br/>
    <div class="buttons2">
        <ul>
            <li><input type="submit" value="Guardar" name="guardar" /></li>
            <li><a href="usuarios_consulta.jsp">Regresar</a></li>
        </ul>
    </div>
</form>
<script>
    function validar() {
        var usuario = document.getElementById('txtIdusuario');
        var nombres = document.getElementById('txtNombres');
        var email = document.getElementById('txtEmail');
        var clave = document.getElementById('txtClave');
        var confirmacion = document.getElementById('txtConfirmar');
        var idempleado = document.getElementById('cmbIdempleado');

        if (usuario.value.length == 0) {
            usuario.focus();
            alert("Digite usuario");
            return false;
        }

        if (nombres.value.length == 0) {
            nombres.focus();
            alert("Digite nombres");
            return false;
        }

        if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(email.value)) {
            email.focus();
            alert("Email incorrecto");
            return false;
        }

        if ((clave.value == "" && confirmacion.value == "") || (clave.value != confirmacion.value)) {
            clave.focus();
            alert("Las claves no coinciden o están vacías");
            return false;
        }

        if (idempleado.value == -1) {
            idempleado.focus();
            alert("Seleccione empleado");
            return false;
        }

        return true;
    }

    function cambiar() {
        var chkClave = document.getElementById('chkClave');
        var old_clave = document.getElementById('old_clave').value;
        if (chkClave.checked) {
            document.getElementById('txtClave').value = "";
            document.getElementById('txtConfirmar').value = "";
        } else {
            document.getElementById('txtClave').value = old_clave;
            document.getElementById('txtConfirmar').value = old_clave;
        }
    }
</script>
<%@include file="../_down.jsp"%>