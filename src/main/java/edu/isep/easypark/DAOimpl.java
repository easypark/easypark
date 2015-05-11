package edu.isep.easypark;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.mysql.jdbc.Statement;

public class DAOimpl {
	private JdbcTemplate jdbcTemplate;


	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		System.out.println("datasource set");
	}

	public List<ParkingLot> fillParkingLot() {

		return this.jdbcTemplate
				.query("select * from place",
						new BeanPropertyRowMapper<ParkingLot>(
								ParkingLot.class));

	}
	
	public int insertPlace(ParkingLot place){
			
	String query = "insert into place (nom, ville, adresse, superficie, horaires, type, commentaire) values(?, ?, ?, ?, ?, ?, ?)";
		int statut = this.jdbcTemplate.update(query, new Object[] { place.nom, place.ville,
				place.adresse, place.superficie, place.horaires, place.type, place.commentaire});
			
		return statut;
	
	}

	public int insertUser(User user) {
	
		String query = "insert into user (email,password) values(?, ?)";
		int statut = this.jdbcTemplate.update(query, new Object[] { user.email, user.password});
		
		query = "insert into user_informations (id_user,name,firstname) values(?, ?,?)";
		statut = this.jdbcTemplate.update(query, new Object[] { 0, user.name, user.firstname});
		return statut;
	
	}
	

	
	 public boolean verifyUser(User user) {
		 
	        String sql = "SELECT count(*) FROM user WHERE email = ? AND password = ?";
		boolean result = false;
	 
		int count = this.jdbcTemplate.queryForObject(
	                        sql, new Object[] { user.email, user.password }, Integer.class);


		if (count > 0) {
			result = true;
		}
	 
		return result;
	  }
	 
	 public int getUserId(User user){
		 String sql = "SELECT ID FROM user WHERE email = ? AND password = ?";
		 int id =  this.jdbcTemplate.queryForObject(
                 sql, new Object[] { user.email, user.password }, Integer.class);
				 
				 return id;
		 
	 }
	

	

	
	
}
