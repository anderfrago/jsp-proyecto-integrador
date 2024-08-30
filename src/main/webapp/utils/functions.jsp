<%@page language="java" import="java.sql.*"%>

<%
// Cargar el achivo con la clase de drivers para MySql
Class.forName("com.mysql.cj.jdbc.Driver");
%>
<%! 

Connection con = null; 

private void connect()  throws SQLException{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/procesoregistrodb","root","");
}

// Función que lanza una consulta SQL contra la base de datos,
// si ha ido bien devuelve la respuesta.
public ResultSet queryMysql(String query) throws SQLException
{
	if( con == null ) connect();
	Statement stmt=con.createStatement();
	ResultSet rs =  stmt.executeQuery(query);
	return rs;
}

public boolean statementMysql(String query) throws SQLException
{
	if( con == null ) connect();
	Statement stmt=con.createStatement();
	return  stmt.execute(query);
}

%>
