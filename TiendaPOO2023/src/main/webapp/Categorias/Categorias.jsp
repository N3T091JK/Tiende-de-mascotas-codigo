<%@page import="java.util.HashMap"%>
<%@page import="procesos.*"%>
<%@page import="entidades.*"%>
<%
 Conexion conn = new ConexionBD();

 Operaciones.setConexion(conn);
    HashMap categoria;   
    String id = null;
     int sw_nuevo;
    //se verifica si hay un ID de pais enviado
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        //obtenemos el registro del pais en base al ID
        categoria = Operaciones.getRegistro(new Categoria(), id);
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        categoria = null;
    }
 %>
 <%@include file="../_top.jsp"%>
<h1>Categorias</h1>
<br/>
<form name="form_categoria" onsubmit="return validar();" action="Categoria_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table2">
    <thead>
        <tr>
            <th colspan="">Complete la información<br><br></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>ID Categoria</td>
            <td><input type="text" name="txtidCategoria" value="<%= categoria!=null? categoria.get("idcategoria"):"" %>" readonly="readonly" /></td>
        </tr>
        <tr>
            <td>Nombre Categoria</td>
            <td><input type="text" name="txtCategoria" id="txtCategoria" value="<%= categoria!=null? categoria.get("categoria"):"" %>" /></td>
        </tr>            
    </tbody>
    </table>
    <br/>    
<div class="buttons2">
    <ul>
        <li><input type="submit" value="Guardar" name="guardar"/></li>
        <li><a href="Categoria_consulta.jsp">Regresar</a></li>
    </ul>
</div>                     
</form>
 <script>
    function validar(){
	var Categorias = document.getElementById('txtCategoria');		

	if (Categorias.value.length==0){
                Categorias.focus();			
                alert("Digite nombre del categoria");
            return false;
	}			
	
	return true;
    }                
</script>
<%@include file="../_down.jsp"%>