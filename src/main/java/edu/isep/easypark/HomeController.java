package edu.isep.easypark;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("loggedUser")
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	private DAOimpl dao;

	public HomeController() throws SQLException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/Bean.xml");

		dao = (DAOimpl) context.getBean("easyparkDAO");

	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/ajouter_place", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("creating new parkingLot object ");
		ParkingLot park = new ParkingLot();
		model.addAttribute("park", park);
		return "ajouter_place";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(ParkingLot park, Model model) {

		// ParkingLot park2 = new ParkingLot();
		logger.info("inserting placemax " + park.ville);
		int statut = dao.insertPlace(park);
		model.addAttribute("park", park);
		model.addAttribute("message", "Votre place à été correctement ajoutée");
		model.addAttribute("link",
				"<a href='ajouter_place'>Ajouter une autre place</a>");

		// else une erreure c'est produite
		return "confirmation";
	}

	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public String adduser(User user, Model model) {

		logger.info("inserting user " + user.name);
		int statut = dao.insertUser(user);

		model.addAttribute("message",
				"Votre inscription est terminée, veuillez à présent vous connecter");
		model.addAttribute("link", "<a href='connexion'>Se connecter</a>");

		return "confirmation";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		return "home_page";
	}

	@RequestMapping(value = "/inscription", method = RequestMethod.GET)
	public String inscription(@RequestParam("structur") String param,
			Model model) {

		logger.info("display formular " + param);

		return "formulaire_inscription";
	}

	@RequestMapping(value = "/connexion", method = RequestMethod.GET)
	public String connect(Model model) {
		User trying = new User();
		model.addAttribute("user", trying);
		return "connexion";
	}
	
	
			
			@RequestMapping(value = "/connect", method = RequestMethod.POST)
	public ModelAndView connecting(User user, Model model) {
				ModelAndView modelAndView = new ModelAndView();
				logger.info("Trying to connect with email " + user.email);
				boolean ishere = dao.verifyUser(user);
				logger.info("is user present? " + ishere);
				if(ishere){
					int id = dao.getUserId(user);			
					logger.info("user id? " + id);
					modelAndView.addObject("loggedUser", user);
				}
				modelAndView.setViewName("connexion");

		return modelAndView;
	}
			
			
			@RequestMapping(value="/disconnect")	
			public ModelAndView disconnect(Model model) {
				ModelAndView modelAndView = new ModelAndView();
				logger.info("Trying to disconnect " );
			
					User voidUser = new User();
					modelAndView.addObject("loggedUser", voidUser);
				
				modelAndView.setViewName("connexion");

		return modelAndView;
	 } 
	


}
