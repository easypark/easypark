package edu.isep.easypark;

import java.sql.SQLException;
import java.util.Locale;

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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,HttpSession session) {
		
		logger.info("Trying to connect with id  " + session.getAttribute("id_user"));

		return "home_page";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2(Model model) {
		return "home_page";
	}

	@RequestMapping(value = "/connexion", method = RequestMethod.GET)
	public String connect(Model model) {
		User trying = new User();
		model.addAttribute("user", trying);
		return "connexion";
	}

	@RequestMapping(value = "/connect", method = RequestMethod.POST)
	public String connecting(User user, Model model, HttpSession session) {
		logger.info("Trying to connect with email " + user.email);
		boolean ishere = dao.verifyUser(user);
		logger.info("is user present? " + ishere);
		if (ishere) {
			user.id = dao.getUserId(user);
			logger.info("user id? " + user.id);
			session.setAttribute("id_user", user.id);
			session.setAttribute("email", user.email);
			session.setAttribute("user",user);
		}

		return "home_page";
	}

	@RequestMapping(value = "/disconnect")
	public String disconnect(Model model, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		logger.info("Trying to disconnect ");


		session.invalidate();
		User voidUser = new User();

		return "home_page";
	}

}
