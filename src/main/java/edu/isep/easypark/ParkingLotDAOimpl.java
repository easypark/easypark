package edu.isep.easypark;


	import javax.sql.DataSource;

	import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

	public class ParkingLotDAOimpl {
		private JdbcTemplate jdbcTemplate;


		public void setDataSource(DataSource dataSource) {
			this.jdbcTemplate = new JdbcTemplate(dataSource);
			System.out.println("datasource set");
		}

		public  ParkingLot getPlaceInf(int id) {

			 String sql = "SELECT * FROM place WHERE id = ?";
			
			  ParkingLot place = (ParkingLot) this.jdbcTemplate.queryForObject(
						sql, new Object[] {id},new BeanPropertyRowMapper(ParkingLot.class));
			  
			  return place;
		}
		
		
}
