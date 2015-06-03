package edu.isep.easypark.controller;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.isep.easypark.DAOimpl;
import edu.isep.easypark.model.Voiture;

@Controller
@SessionAttributes("loggedUser")
public class VoitureController {
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	private DAOimpl dao;

	public VoitureController() throws SQLException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/Bean.xml");

		dao = (DAOimpl) context.getBean("easyparkDAO");
	}
	
	@RequestMapping(value = "/addvoiture", method = RequestMethod.POST)
	public String add(Voiture car, Model model,HttpSession session) {

		// ParkingLot park2 = new ParkingLot();
		logger.info("inserting placemax " + car.getMarque());
		car.setId_user((Integer) session.getAttribute("id_user"));
		int statut = dao.insertVoiture(car);
		model.addAttribute("car", car);
		model.addAttribute("message", "Votre voiture à été correctement ajoutée");
		model.addAttribute("link",
				"<a href='ajouter_voiture'>Ajouter une autre voiture</a>");

		// else une erreure c'est produite
		return "confirmation";
	}
	
	@RequestMapping(value = "/ajouter_voiture", method = RequestMethod.GET)
	public String ajouterVoiture(Locale locale, Model model) {
		logger.info("creating new voiture object ");
		Voiture car = new Voiture();
		model.addAttribute("car", car);
		return "ajouter_voiture";
	}

}
