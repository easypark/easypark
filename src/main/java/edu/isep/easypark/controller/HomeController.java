package edu.isep.easypark.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.isep.easypark.DAOimpl;
import edu.isep.easypark.model.User;
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



	@RequestMapping(value = {"/home", "/"}, method = RequestMethod.GET)
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
		user.setPassword(UserController.md5(user.getPassword()));
		logger.info("Log request " + user.getEmail() + "  -  "+ user.getPassword());

		boolean ishere = dao.verifyUser(user);
	
		if (ishere) {
			user.setId(dao.getUserId(user));
			logger.info("user role? " + user.getRole());
			session.setAttribute("id_user", user.getId());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("user",user);
			
			if(user.getRole().equals("admin")){
				return "home_page_bo";
			}
			else{
			return "home_page";
			}
		}else{
			model.addAttribute("wrong", "Mauvaise combinaison adresse mail - Mot de passe");
			if(user.getRole().equals("admin")){
				return "co_bo";
			}
			else{
			return "connexion";
			}
			
		}

		
	}

	@RequestMapping(value = "/disconnect")
	public String disconnect(Model model, HttpSession session) {

		session.invalidate();
		User voidUser = new User();

		return "home_page";
	}

	

	@RequestMapping(value = "/mail")
	public String mailForm(Model model, HttpSession session) {
		
		return "EmailForm";
	}
	
		
		
	
}
