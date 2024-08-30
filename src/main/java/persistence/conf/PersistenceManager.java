package persistence.conf;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PersistenceManager {
	
	private static PersistenceManager instance;
	private static Connection conn;
	
	private String userdb = "root";
	private String passwdb = "";
	private String namedb = "procesoregistrodb";
	private String hostdb = "localhost";
	
	public static PersistenceManager getInstance()  {
		if(instance == null) {
			try {
				instance = new PersistenceManager();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	
	public PersistenceManager() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String strConnection = "jdbc:mysql://"+hostdb+":3306/"+namedb;
		conn = DriverManager.getConnection(  strConnection ,userdb,passwdb);
	}
	
	public void closeConnection() throws SQLException {
		conn.close();
	}
	
	public Connection getConnecion() {
		return conn;
	}
	
}
