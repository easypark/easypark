package edu.isep.easypark;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.easypark.model.Commentaires;
import edu.isep.easypark.model.Reservation;

public class PlaceDAOimpl {

	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		System.out.println("datasource set");
	}

	public void insertReservation(Reservation resa) {


//		String query = "insert into reservation (title,  id_place, id_user, status, color,) values(?, ?, ?, ?, ?)";
//		int statut = this.jdbcTemplate.update(query, new Object[] { title, 1, 2, status, color });
//
//		return statut;
		
		
			String query ="insert into reservation (title, start, end,id_place, id_user, status, color) values (?,?,?,?,?,?,?)";
			 this.jdbcTemplate.update(query, new Object[] {resa.getTitle(), resa.getStart(),resa.getEnd(), resa.getId_place(),resa.getId_user(),resa.getStatus(),resa.getColor()});
			}

	public void deleteReservation(int event_id) {
		// TODO Auto-generated method stub
		
		this.jdbcTemplate.update("DELETE FROM reservation WHERE id = ?", new Object[] { event_id });
	  
		
	}

	public void eventUpdate(int event_id, String event_color,
			String event_status, String event_title, int id_user) {
		this.jdbcTemplate.update(
                "update reservation  set title = ?, color = ?,status = ?, id_user = ? where id = ?", 
                event_title, event_color, event_status,id_user,event_id);		
	}
	public void eventUpdate(int event_id, String event_color,
			String event_status) {
		this.jdbcTemplate.update(
                "update reservation  set color = ?,status = ?  where id = ?", 
                 event_color, event_status,event_id);		
	}

	public void erasePlace(int place_id) {
		this.jdbcTemplate.update("DELETE FROM place WHERE id = ?", new Object[] { place_id });

	}

	public void eraseUser(int user_id) {
		this.jdbcTemplate.update("DELETE FROM user WHERE ID = ?", new Object[] { user_id });
		this.jdbcTemplate.update("DELETE FROM user_informations WHERE id_user = ?", new Object[] { user_id });
		this.jdbcTemplate.update("DELETE FROM place WHERE id_user = ?", new Object[] { user_id });
		this.jdbcTemplate.update("DELETE FROM user WHERE ID = ?", new Object[] { user_id });
		this.jdbcTemplate.update("DELETE FROM voiture WHERE id_user = ?", new Object[] { user_id });

	}

	public void makeAdmin(int user_id, String role) {
		this.jdbcTemplate.update(
                "update user set role = ?  where ID = ?", 
                 role,user_id);		
	}
	

}