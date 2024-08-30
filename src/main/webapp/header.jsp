
<%@ include file="./utils/functions.jsp" %> 
<%
String strUser = "(Invitado)";

// La sesión será anulada tras 15 minutos de inactividad.
session.setMaxInactiveInterval(60*15);

boolean isLoggedin = false;

if(session.getAttribute("user") != null	) {
	isLoggedin = true;	
	strUser = session.getAttribute("user").toString();
} 

%>
<html lang="eus">
<head>
<meta charset="utf-8">
<title>Proceso registro</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>

	<%
    if(isLoggedin){ 
    //  En caso de tener una sesión registrada con antelación mostramos las opciones avanzadas de la aplicación
   	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light  px-5">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="jsp">4vSocial</a>

		<div class="collapse navbar-collapse  d-flex justify-content-end" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-md-0">
				<li class="nav-item"><p class="my-2">Hola <%  out.println(strUser); %></p>
				</li>
				<li class="nav-item"><a class="nav-link" href="logout.jsp">Salir</a>
				</li>
			</ul>
		</div>
	</nav>
	<%
	} else {
		// En caso de ser usuario no registrado, (Invitado) 
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light px-5">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="index.jsp">4vSocial</a>

		<div class="collapse navbar-collapse d-flex justify-content-end" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-md-0">
				<li class="nav-item"><p class="my-2">Hola <%  out.println(strUser); %></p>
				</li>
				<li class="nav-item"><a class="nav-link" href="signup.jsp">Registrarse</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Entrar</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="logout.jsp">Salir</a>
				</li>
				
			</ul>
		</div>
	</nav>

	<%} %>
</body>
</html>