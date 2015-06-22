package edu.isep.easypark;
/*Test*/
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.easypark.model.Comment;
import edu.isep.easypark.model.Commentaires;
import edu.isep.easypark.model.ParkingLot;
import edu.isep.easypark.model.User;
import edu.isep.easypark.model.UserFull;
import edu.isep.easypark.model.UserInformations;
import edu.isep.easypark.model.Voiture;

public class DAOimpl {
	private JdbcTemplate jdbcTemplate;


	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		System.out.println("datasource set");
	}

	public List<ParkingLot> fillParkingLot() {

		String orderby ="note";
		String sort ="DESC";
		String sql = "select * from place order by ";
		return this.jdbcTemplate
				.query(sql+orderby+" "+sort,	new BeanPropertyRowMapper<ParkingLot>(
								ParkingLot.class));

	}
	
	
	public List<ParkingLot> fillParkingLot(String orderby, String sort) {

	
		String sql = "select * from place order by ";
		return this.jdbcTemplate
				.query(sql+orderby+" "+sort,	new BeanPropertyRowMapper<ParkingLot>(
								ParkingLot.class));

	}
	
//	public List<ParkingLot> fillParkingLot2(String adresse, String id_user) {
//	
//	adresse = "%" + adresse + "%";
//    String sql = "select * from place where adresse like ? and id_user like ?";
//
//	           return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper<ParkingLot>(
//						ParkingLot.class),  adresse, id_user);
//	 
//	                      }
	
	
	public List<ParkingLot> fillParkingLot2(String adresse, String date) {
		
	adresse = "%" + adresse + "%";
	date =date + "%";
    String sql = "select * from place, reservation where place.adresse like ? and reservation.start like ?  and reservation.id_place = place.id";

	           return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper<ParkingLot>(
						ParkingLot.class),  adresse, date);
	 
	                      }
	
	public List<ParkingLot> fillParkingLot(int user_id) {
		
		
	    String sql = "select * from place where id_user = ?";

		           return this.jdbcTemplate.query(sql, new BeanPropertyRowMapper<ParkingLot>(
							ParkingLot.class),  user_id);
		 
		                      }
	
	
	public int insertPlace(ParkingLot place){
			
	String query = "insert into place (nom, ville, adresse, superficie, horaires, type, commentaire, id_user,note) values(?, ?, ?, ?, ?, ?, ?,?,?)";
		int statut = this.jdbcTemplate.update(query, new Object[] { place.getNom(), place.getVille(),
				place.getAdresse(), place.getSuperficie(), place.getHoraires(), place.getType(), place.getCommentaire(), place.getId_user(),place.getNote()});
			
		return statut;
	
	}

	public int insertUser(User user, UserInformations userInformations) {
	
		String query = "insert into user (email,password) values(?, ?)";
		String query2 = "insert into user_informations (id_user, name, firstname) values (?,?,?)";
		
		this.jdbcTemplate.update(query, new Object[] { user.getEmail(), user.getPassword()});
		int id_user = getUserId(user);
		
		this.jdbcTemplate.update(query2, new Object[] { id_user, userInformations.getName(), userInformations.getFirstname()});

		
		return id_user;
	}
	

	
	 public boolean verifyUser(User user) {
		 
	        String sql = "SELECT count(*) FROM user WHERE email = ? AND password = ? AND role = ?";
		boolean result = false;
	 
		int count = this.jdbcTemplate.queryForObject(
	                        sql, new Object[] { user.getEmail(), user.getPassword(), user.getRole() }, Integer.class);

		if (count > 0) {
			result = true;
		}
	 
		return result;
	  }
	 
	 public int getUserId(User user){
		 String sql = "SELECT ID FROM user WHERE email = ? AND password = ?";
		 int id =  this.jdbcTemplate.queryForObject(
                 sql, new Object[] { user.getEmail(), user.getPassword() }, Integer.class);
				 
				 return id;
		 
	 }
	 
	 public String getUserName(int user_id){
		 String sql = "SELECT name FROM user_informations WHERE id_user = ?";
		 String name =  this.jdbcTemplate.queryForObject(
                 sql, new Object[] { user_id }, String.class);
				 
				 return name;
		 
	 }
	 

	public  UserInformations getUserInf(int user_id) {

		 String sql = "SELECT id_user, firstname, name FROM user_informations WHERE id_user = ?";
		
		  UserInformations userinf = (UserInformations) this.jdbcTemplate.queryForObject(
					sql, new Object[] {user_id},new BeanPropertyRowMapper(UserInformations.class));
		  
		  return userinf;
	}
	
public int insertVoiture(Voiture car){
		
		String query = "insert into voiture (marque, modèle, taille, id_user) values(?, ?, ?,?)";
			int statut = this.jdbcTemplate.update(query, new Object[] { car.getMarque(), car.getModele(),
					car.getTaille(), car.getId_user()});
				
			return statut;
		
		}
	
public void insertcom(Commentaires com){
	String query ="insert into commentaires (content, note, id_place, id_user, id_writter) values (?,?,?,?,?)";
	 this.jdbcTemplate.update(query, new Object[] {com.getContent(), com.getNote(), com.getId_place(), com.getId_user(), com.getId_writter()});
}



public List<Comment> fillComment(String type, int id) {

	
	String sql = "select * from commentaires where ";
	return this.jdbcTemplate
			.query(sql+type+" = "+id+" order by date desc",	new BeanPropertyRowMapper<Comment>(
							Comment.class));

}

public int getnote(String type, int id) {

	String sql = "select avg(note) from commentaires where ";
	
	int moyenne = this.jdbcTemplate.queryForInt(sql+type+" = "+id);
//			.query(sql+type+" = "+id,	
//					Integer.class);
	
	return moyenne;
	
}

public Object hasvoted(String type, int id, int id_user) {

    String sql = "SELECT count(*) FROM commentaires WHERE note > 0 and id_writter = ? AND ";
		boolean result = false;
	 
		int count = this.jdbcTemplate.queryForObject(
	                        sql+type+" = "+id , new Object[] { id_user }, Integer.class);


		if (count > 0) {
			result = true;
		}
		return result;
}

public  UserInformations getUserFull(int user_id) {

	 String sql = "SELECT id_user, firstname, name FROM user_informations WHERE id_user = ?";
	
	  UserInformations userinf = (UserInformations) this.jdbcTemplate.queryForObject(
				sql, new Object[] {user_id},new BeanPropertyRowMapper(UserInformations.class));
	  
	  return userinf;
}
public List<UserFull> fillUserFull() {

	
	String sql = "select * from user, user_informations where user.ID=user_informations.id_user and user.role != 'admin'";
	return this.jdbcTemplate
			.query(sql,	new BeanPropertyRowMapper<UserFull>(
							UserFull.class));

}

public List<Comment> fillComment() {
	String sql = "select * from commentaires ";
	return this.jdbcTemplate
			.query(sql+" order by date desc",	new BeanPropertyRowMapper<Comment>(
							Comment.class));
}

public List<UserFull> fillAdminFull() {
	String sql = "select * from user, user_informations where user.ID=user_informations.id_user and user.role = 'admin'";
	return this.jdbcTemplate
			.query(sql,	new BeanPropertyRowMapper<UserFull>(
							UserFull.class));
}

}
