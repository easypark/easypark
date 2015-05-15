package edu.isep.easypark;

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
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("loggedUser")
public class UserController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	private DAOimpl dao;

	public UserController() throws SQLException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/Bean.xml");

		dao = (DAOimpl) context.getBean("easyparkDAO");

	}

	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public String adduser(User user, UserInformations userinf, Model model) {

		logger.info("inserting user " + user.email + "firstname : "
				+ userinf.firstname);
		int statut = dao.insertUser(user, userinf);
		logger.info("Inserted user with id :  " + statut);

		model.addAttribute("message",
				"Votre inscription est terminée, veuillez à présent vous connecter");
		model.addAttribute("link", "<a href='connexion'>Se connecter</a>");

		return "confirmation";
	}

	@RequestMapping(value = "/inscription", method = RequestMethod.GET)
	public String inscription(@RequestParam("structur") String param,
			Model model) {

		logger.info("display formular " + param);

		return "formulaire_inscription";
	}

	@RequestMapping(value = "/page_utilisateur", method = RequestMethod.GET)
	public String userPage(Model model, HttpSession session, @RequestParam("id_user") int user_id) {

		UserInformations userInf = new UserInformations();
		userInf = dao.getUserInf(user_id);
		
		logger.info("Result of the query :  " + userInf.firstname);
		
		model.addAttribute("userInf",userInf);
		
		
		ParkingLot searchFor = new ParkingLot();
		searchFor.adresse = "";
		searchFor.id_user = user_id;

		List<ParkingLot> list = dao.fillParkingLot2(searchFor);
		model.addAttribute("list", list);

		 model.addAttribute("searchFor", searchFor);
		

		return "page_utilisateur";
	}

	@RequestMapping(value = "/mon_profil", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {

		ParkingLot searchFor = new ParkingLot();
		searchFor.adresse = "";
		searchFor.id_user = (Integer) session.getAttribute("id_user");

		List<ParkingLot> list = dao.fillParkingLot2(searchFor);
		model.addAttribute("list", list);

		return "mon_profil";
	}

}
