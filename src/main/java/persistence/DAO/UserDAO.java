package persistence.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import persistence.conf.PersistenceManager;
import persistence.model.User;

public class UserDAO implements IGenericDAO {
	
	private Connection conn ;
	
	public UserDAO() {
		this.conn = PersistenceManager.getInstance().getConnecion();
	}

	@Override
	public void insert(String... args) {
		String query = "INSERT INTO users (email,password) VALUES (?,?)";
		PreparedStatement ps;
		try {
			ps = this.conn.prepareStatement(query);
			ps.setString(1, args[0]);
			ps.setString(2, args[1]);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public ArrayList<Object> selectAll() {
		ArrayList result = new ArrayList();
		String query = "SELECT * FROM users";
		Statement st;
		try {
			st = this.conn.createStatement();
			ResultSet rs = st.executeQuery(query);

			while(rs.next()) {
				int id = rs.getInt(1);
				String email = rs.getString(2);
				String password = rs.getString(3);
				User user = new User(id,email,password);
				result.add(user);
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}	

		return result;
	}

	@Override
	public Object selectById(int id) {
		User user = new User();
		String query = "SELECT * FROM users WHERE id = ?";
		PreparedStatement ps;
		try {
			ps = this.conn.prepareStatement(query);
			ps.setString(1, id+"");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String email = rs.getString(2);
				String password = rs.getString(3);
				user = new User(id,email,password);
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}	

		return user;
	}

	@Override
	public void update(int id, String... args) {
		String query = "UPDATE users SET email = ? , password = ? WHERE id = ?";
		PreparedStatement ps;
		try {
			ps = this.conn.prepareStatement(query);
			ps.setString(2, args[1]);
			ps.setString(3, args[2]);
			ps.setInt(1, id);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public void delete(int id) {
		String query = "DELETE FROM users WHERE id = ?";
		PreparedStatement ps;
		try {
			ps = this.conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}
	
	/// TODO generate selectByField function
	
	public Object selectByField(String value,String field) {
		User user = new User();
		String query = "SELECT * FROM users WHERE "+field+" = ?";
		PreparedStatement ps;
		try {
			ps = this.conn.prepareStatement(query);
			ps.setString(1, value);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int id = rs.getInt(1);
				String email = rs.getString(2);
				String password = rs.getString(3);
				user = new User(id,email,password);
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}	

		return user;
	}

	

}
