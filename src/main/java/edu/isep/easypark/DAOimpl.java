package edu.isep.easypark;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

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
	
	public List<ParkingLot> fillParkingLot2(ParkingLot parkingLot) {
	
	parkingLot.adresse="%".concat(parkingLot.adresse).concat("%"); //SQL à l'air d'échapper les %
	     String sql = "select * from place where adresse like ? and id_user like ?";

	           return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper<ParkingLot>(
						ParkingLot.class),  parkingLot.adresse, parkingLot.id_user);
	 
	                      }
	
	
	
	public int insertPlace(ParkingLot place){
			
	String query = "insert into place (nom, ville, adresse, superficie, horaires, type, commentaire) values(?, ?, ?, ?, ?, ?, ?)";
		int statut = this.jdbcTemplate.update(query, new Object[] { place.nom, place.ville,
				place.adresse, place.superficie, place.horaires, place.type, place.commentaire});
			
		return statut;
	
	}

	public int insertUser(User user, UserInformations userInformations) {
	
		String query = "insert into user (email,password) values(?, ?)";
		String query2 = "insert into user_informations (id_user, name, firstname) values (?,?,?)";
		
		this.jdbcTemplate.update(query, new Object[] { user.email, user.password});
		int id_user = getUserId(user);
		
		this.jdbcTemplate.update(query2, new Object[] { id_user, userInformations.name, userInformations.firstname});

		
		return id_user;
		
		
//		query = "insert into user_informations (id_user,name,firstname) values(?, ?,?)";
//		statut = this.jdbcTemplate.update(query, new Object[] { 0, user.name, user.firstname});
		
	
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

	public  UserInformations getUserInf(int user_id) {

		 String sql = "SELECT id_user, firstname, name FROM user_informations WHERE id_user = ?";
		
		  UserInformations userinf = (UserInformations) this.jdbcTemplate.queryForObject(
					sql, new Object[] {user_id},new BeanPropertyRowMapper(UserInformations.class));
		  
		  return userinf;
	}
	
	

	
	
}
