package persistence.DAO;

import java.sql.Connection;
import java.util.ArrayList;

import persistence.conf.PersistenceManager;

public interface IGenericDAO {
	
	public void insert(String... args);
	public ArrayList<Object> selectAll();
	public Object selectById(int id);
	public void update(int id, String... args);
	public void delete(int id);

}
