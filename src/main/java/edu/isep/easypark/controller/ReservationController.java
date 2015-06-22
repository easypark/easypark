package edu.isep.easypark.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import edu.isep.easypark.DAOimpl;
import edu.isep.easypark.ParkingLotDAOimpl;
import edu.isep.easypark.PlaceDAOimpl;
import edu.isep.easypark.model.Comment;
import edu.isep.easypark.model.Commentaires;
import edu.isep.easypark.model.ParkingLot;
import edu.isep.easypark.model.Reservation;
import edu.isep.easypark.model.User;

@Controller
@SessionAttributes("loggedUser")
public class ReservationController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	private DAOimpl dao;
	private ParkingLotDAOimpl dao2;
	private PlaceDAOimpl dao3;

	public ReservationController() throws SQLException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/Bean.xml");

		dao = (DAOimpl) context.getBean("easyparkDAO");
		dao2 = (ParkingLotDAOimpl) context.getBean("easyparkDAOpl");
		dao3 = (PlaceDAOimpl) context.getBean("easyparkDAOplace");

	}

	@RequestMapping(value = "/addre", method = RequestMethod.GET)
	public void connect(Model model) {

		Reservation res = new Reservation();

		dao3.insertReservation(res);

	}

	@RequestMapping("/ajax")
	public ModelAndView helloAjaxTest() {
		return new ModelAndView("testcom", "message",
				"Crunchify Spring MVC with Ajax and JQuery Demo..");
	}

	@RequestMapping("/deleteEvent")
	public @ResponseBody void DeleteEvent(
			@RequestParam(value = "event_id") int event_id) {

		dao3.deleteReservation(event_id);
		System.out.println("deleting id" + event_id);

	}

	@RequestMapping("/eventUpdate")
	public @ResponseBody void eventUpdate(HttpSession session,
			@RequestParam(value = "event_id") int event_id,
			@RequestParam(value = "event_color") String event_color,
			@RequestParam(value = "event_status") String event_status,
			@RequestParam(value = "event_title") String event_title) {

		int id_user = (Integer) session.getAttribute("id_user");
		if(event_title.equals("null")){
		 event_title= dao.getUserName(id_user);
		}
		if(event_status.equals("free")){
			id_user=0;
		}

		dao3.eventUpdate(event_id,event_color,event_status,event_title,id_user);
		
	}
	@RequestMapping("/eventUpdate2")
	public @ResponseBody void eventUpdate(HttpSession session,
			@RequestParam(value = "event_id") int event_id,
			@RequestParam(value = "event_color") String event_color,
			@RequestParam(value = "event_status") String event_status) {

//		System.out
//		.println("user name" + user_name);

		dao3.eventUpdate(event_id,event_color,event_status);
		
	}
	
	
	@RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
	public @ResponseBody String getTime(
			@RequestParam(value = "title") String title,
			@RequestParam(value = "color") String color,
			@RequestParam(value = "start") Timestamp start,
			@RequestParam(value = "end") Timestamp end,
			@RequestParam(value = "id_user") int id_user,
			@RequestParam(value = "id_place") int id_place) {
		Reservation res = new Reservation();
		res.setTitle(title);
		res.setColor(color);
		res.setId_user(0);
		res.setId_place(id_place);
		res.setStatus("free");
		res.setEnd(end);
		res.setStart(start);

		System.out.println("dates" + start + " end " + end);

		dao3.insertReservation(res);
		System.out.println("insert in base" + title + "  " + color + start
				+ end + id_place);

		return color;
	}

}
