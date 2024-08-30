<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="header.jsp" %>


<% 
String user, pass, error="";
/*
Al pulsar el boton del formulario se recarga la misma página, volviendo a ejecutar este script.
En caso de que se haya  completado los valores del formulario se verifica la existencia de usuarios en la base de datos
para los valores introducidos.
*/

if( request.getParameter("email")  == null && request.getParameter("password") == null ){
	error = "Debes completar todos los campos<br>";
} else {
	// TODO Esta la consulta de base de datos correspondiente para verificar si el usuario existe
    // ResultSet result = queryMySQL("");
	String query = "select * from users where email = '"+request.getParameter("email") +"' and password = '"+request.getParameter("password")+"' " ;
	ResultSet result = queryMysql(query);
	
	if(!result.next()){
		error = "<span class='error'>Email/Contraseña invalida</span><br />";
	} else {
		// TODO Realiza la gestión de la sesión de usuario:
     	// Almacena en la variables de sesión user el valore de $user
     	session.setAttribute("user", request.getParameter("email"));
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
	}
}

%>
<div class="container">
	<form class="form-horizontal" role="form" method="POST"
		action="login.jsp">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Introduzca detalles del acceso</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="form-group has-danger">
					<label class="sr-only" for="email">Email:</label>
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon" style="width: 2.6rem"></div>
						<!--
                         TODO Corrige el BUG
                          -->
						<input type="text" name="email" class="form-control" id="email"
							placeholder="yoxti@ejemplo.com" required autofocus>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-control-feedback">
					<span class="text-danger align-middle"> <i
						class="fa fa-close"></i> <% 
					 // TODO Muestra el mensaje de error
					 out.println(error);
					 %>
					</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="sr-only" for="pass">Contraseña:</label>
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon" style="width: 2.6rem"></div>
						<input type="password" name="password" class="form-control"
							id="password" placeholder="Contraseña" required>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-control-feedback">
					<span class="text-danger align-middle">
					 <% 
					 // TODO Muestra el mensaje de error
					 out.println(error);
					 %>
					</span>
				</div>
			</div>
		</div>
		<div class="row" >
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<button type="submit" class="btn btn-success">
					<i class="fa fa-sign-in"></i> Acceder
				</button>
			</div>
		</div>
	</form>
</div>