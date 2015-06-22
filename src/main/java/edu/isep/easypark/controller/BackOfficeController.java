package edu.isep.easypark.controller;

import java.sql.SQLException;
import java.util.List;

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

import edu.isep.easypark.DAOimpl;
import edu.isep.easypark.PlaceDAOimpl;
import edu.isep.easypark.model.Comment;
import edu.isep.easypark.model.ParkingLot;
import edu.isep.easypark.model.User;
import edu.isep.easypark.model.UserFull;

@Controller
public class BackOfficeController {
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	private DAOimpl dao;
	private PlaceDAOimpl dao3;

	public BackOfficeController() throws SQLException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/Bean.xml");

		dao = (DAOimpl) context.getBean("easyparkDAO");
		dao3 = (PlaceDAOimpl) context.getBean("easyparkDAOplace");

	}

	@RequestMapping(value = "/home_page_bo", method = RequestMethod.GET)
	public String home(Model model) {
		return "home_page_bo";
	}

	@RequestMapping(value = "/co_bo", method = RequestMethod.GET)
	public String connexionbo(Model model) {
		return "co_bo";
	}

	@RequestMapping(value = "/gestion_utilisateur", method = RequestMethod.GET)
	public String gutilisateur(Model model) {
		List<UserFull> list = dao.fillUserFull();
		model.addAttribute("list", list);

		return "gestion_utilisateur";
	}
	
	@RequestMapping("/admins")
	public String  admins(HttpSession session, Model model) {
		List<UserFull> list = dao.fillAdminFull();
		model.addAttribute("list", list);
		return "administrateurs_bo";
		
	}

	@RequestMapping(value = "/gestion_commentaire", method = RequestMethod.GET)
	public String gcommentaire(Model model) {
		List<Comment> list2 = dao.fillComment();
		model.addAttribute("list2", list2);
		return "gestion_commentaire";
	}

	@RequestMapping(value = "/gestion_place", method = RequestMethod.GET)
	public String gplace(Model model, @RequestParam("oby") String orderby,
			@RequestParam("sort") String sort) {

		ParkingLot searchFor = new ParkingLot();
		model.addAttribute("searchFor", searchFor);

		List<ParkingLot> list = dao.fillParkingLot(orderby, sort);
		model.addAttribute("list", list);

		if (sort.equals("asc")) {
			model.addAttribute("sort", "desc");
		} else if (sort.equals("desc")) {
			model.addAttribute("sort", "asc");

		}

		return "gestion_place";
	}
	
	@RequestMapping("/erasePlace")
	public @ResponseBody void erasePlace(HttpSession session,
			@RequestParam(value = "place_id") int place_id) {
		System.out.println("place id" + place_id);
		dao3.erasePlace(place_id);
		
	}
	
	@RequestMapping("/eraseUser")
	public @ResponseBody void eraseUser(HttpSession session,
			@RequestParam(value = "user_id") int user_id) {
		System.out.println("deleting user id" + user_id);

		dao3.eraseUser(user_id);
		
	}
	@RequestMapping("/makeAdmin")
	public @ResponseBody void makeAdmin(HttpSession session,
			@RequestParam(value = "user_id") int user_id, @RequestParam(value = "role") String role) {
		System.out.println("Making "+role+" user id " + user_id);

		dao3.makeAdmin(user_id,role);
		
	}


	
}
