	package edu.isep.easypark;


	import java.util.List;

import javax.sql.DataSource;

	import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import edu.isep.easypark.model.ParkingLot;
import edu.isep.easypark.model.Reservation;

	public class ParkingLotDAOimpl {
		private JdbcTemplate jdbcTemplate;


		public void setDataSource(DataSource dataSource) {
			this.jdbcTemplate = new JdbcTemplate(dataSource);
			System.out.println("datasource set");
		}

		public  ParkingLot getPlaceInf(int id) {

			 String sql = "SELECT * FROM place WHERE id = ? ";
			
			  ParkingLot place = (ParkingLot) this.jdbcTemplate.queryForObject(
						sql, new Object[] {id},new BeanPropertyRowMapper(ParkingLot.class));
			  
			  return place;
		}
		
		public List<Reservation> fillReservation(int id_place) {

			
			String sql = "select * from reservation where id_place = ?";
			return this.jdbcTemplate
					.query(sql,new Object[] {id_place}	,new BeanPropertyRowMapper<Reservation>(
									Reservation.class));

		}

		public List<Reservation> fillReservation2(int id_place, int user_id) {
			String sql = "select * from reservation where (status = 'free' or id_user = ?) and id_place = ?";
			return this.jdbcTemplate
					.query(sql,new Object[] {user_id,id_place}	,new BeanPropertyRowMapper<Reservation>(
									Reservation.class));
		}
		
		
}
