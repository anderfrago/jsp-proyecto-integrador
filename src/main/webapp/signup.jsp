<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%

String user = "", pass = "", error = "";

if(request.getParameter("email") != null){
	
	 // TODO Realiza la lectura de los campos del formulario en $user y $pass
	 // user=""
	 // pass=""
	 user = request.getParameter("email").toString();
	 pass = request.getParameter("password").toString();
	 
	 if(user.equals("") || pass.equals("")){
		 error = "Debes completar todos los campos";
	 } else {
		 String query = "SELECT * FROM users WHERE email = '"+user+"'";
		 ResultSet result = queryMysql(query);
		 
		 if(result.next()){
			 error = "El usuario ya existe";
		 } else {
			 statementMysql("INSERT INTO users(email,password) VALUES('"+user+"', '"+pass+"')");

		      // TODO
		      // Establecer el almacenamiento de usuario en una variable "user" almacenada en sesión
		      // para que al pulsar sobre el menú de Acceder no se le vuelva a preguntar por usuario/contraseña
		      session.setAttribute("user", user);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	        dispatcher.forward(request, response);

		 }
		 
	 }
	 
	
}
%>

<div class="container">
	<form class="form-horizontal" role="form" method="POST"
		action="signup.jsp">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Por favor registrate</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="form-group has-danger">
					<label class="sr-only" for="email">Email:</label>
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon" style="width: 2.6rem">
							<i class="fa fa-at"></i>
						</div>
						<input type="text" name="email" class="form-control" id="email"
							placeholder="vivayo@correo.com" required autofocus>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-control-feedback">
					<span class="text-danger align-middle"> <i
						class="fa fa-close"></i> <?php // TODO: Muestra mensaje de error ?>
					</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="sr-only" for="password">Contraseña:</label>
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon" style="width: 2.6rem">
							<i class="fa fa-key"></i>
						</div>
						<input type="password" name="password" class="form-control"
							id="password" placeholder="Password" required>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-control-feedback">
					<span class="text-danger align-middle"> <% //  TODO: Muestra mensaje de error 
                        if(!error.equals(""))
                        	out.println(error);
                        %>
					</span>
				</div>
			</div>
		</div>

		<div class="row" style="padding-top: 1rem">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<button type="submit" class="btn btn-success">
					<i class="fa fa-sign-in"></i> Acceder
				</button>
			</div>
		</div>
	</form>
</div>