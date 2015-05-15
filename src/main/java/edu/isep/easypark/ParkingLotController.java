package edu.isep.easypark;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

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

@Controller
public class ParkingLotController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	private DAOimpl dao;

	public ParkingLotController() throws SQLException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/Bean.xml");

		dao = (DAOimpl) context.getBean("easyparkDAO");

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
	
	@RequestMapping(value = "/rechercher_place", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		ParkingLot searchFor = new ParkingLot();
		model.addAttribute("searchFor", searchFor);
		
		List<ParkingLot> list = dao.fillParkingLot();
		model.addAttribute("list", list);
		
		return "rechercher_place";
		
		
		
	}
	

	@RequestMapping(value = "/rechercher_place_advance", method = RequestMethod.POST)
	public String rechercheAvance(Locale locale, Model model, ParkingLot searchFor) {

		logger.info("Researching for this user : " + searchFor.id_user);
		logger.info("Researching at this place : " + searchFor.adresse);
		
		ParkingLot searchForNew = new ParkingLot();
		model.addAttribute("searchFor", searchForNew);
		
		List<ParkingLot> list = dao.fillParkingLot2(searchFor);
		model.addAttribute("list", list);
		
		return "rechercher_place";
		
	}
	
	
	@RequestMapping(value = "/ajouter_place", method = RequestMethod.GET)
	public String ajouterPlace(Locale locale, Model model) {
		logger.info("creating new parkingLot object ");
		ParkingLot park = new ParkingLot();
		model.addAttribute("park", park);
		return "ajouter_place";
	}

	
	
}
