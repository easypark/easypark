package edu.isep.easypark;

import java.sql.SQLException;
import java.util.List;
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

@Controller
@SessionAttributes("loggedUser")

public class ParkingLotController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	private DAOimpl dao;
	private ParkingLotDAOimpl dao2;

	public ParkingLotController() throws SQLException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/Bean.xml");

		dao = (DAOimpl) context.getBean("easyparkDAO");
		dao2 = (ParkingLotDAOimpl) context.getBean("easyparkDAOpl");
	}
	

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(ParkingLot park, Model model, HttpSession session) {

	
		park.id_user=(Integer) session.getAttribute("id_user");
		park.note=0;
		
		// ParkingLot park2 = new ParkingLot();
		logger.info("inserting placemax " + park.ville);
		int statut = dao.insertPlace(park);
		model.addAttribute("park", park);
		model.addAttribute("message", "Votre place à été correctement ajoutée");
		model.addAttribute("link",
				"<a href='ajouter_place'>Ajouter une autre place</a><br>"
				+ "<a href='ajouter_voiture'>Ajouter un véhicule</a>"
				
				);

		// else une erreure c'est produite
		return "confirmation";
	}
	
	@RequestMapping(value = "/rechercher_place", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam("oby") String orderby, @RequestParam("sort") String sort) {
		
		
		ParkingLot searchFor = new ParkingLot();
		model.addAttribute("searchFor", searchFor);
		

	List<ParkingLot> list = dao.fillParkingLot(orderby, sort);
	model.addAttribute("list", list);
	
	if(sort.equals("asc")){
		model.addAttribute("sort","desc");
	}
	else if(sort.equals("desc")){
		model.addAttribute("sort","asc");

	}


		
		
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

	@RequestMapping(value = "/place", method = RequestMethod.GET)
	public String place(@RequestParam("id_place") int id_place , Model model, HttpSession session) {
		
		logger.info("Testing  stuff ");

		ParkingLot parkingLot= dao2.getPlaceInf(id_place);
		
		User user = (User) session.getAttribute("user");
		
		
		if(user.id==parkingLot.id_user){
			
			model.addAttribute("action", "<a href='#'>Modifier les information de votre place</a>");
		}
		else{
			model.addAttribute("action", "demander une reservation");

		}
		
		
		model.addAttribute("hasvoted",dao.hasvoted("id_place",id_place,user.id));
//		logger.info(" "+note);
		
		List<Comment> list2 = dao.fillComment("id_place",id_place);
		model.addAttribute("list2",list2);
		
		int note = dao.getnote("id_place",id_place);
		
		

		
		model.addAttribute("note", note);
		model.addAttribute("place", parkingLot);
		model.addAttribute("id_place", id_place);
		
		return "place";
		
		
		
	}
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String testCalendar(Locale locale, Model model) {

		List<Reservation> list = dao2.fillReservation();
		model.addAttribute("list", list);	
		
		return "testCalendar";
	}
	
	@RequestMapping(value = "/add_commentaire2", method = RequestMethod.POST) //changer ca un de ces jouts
	public String addcom(Commentaires commentaire, Model model, HttpSession session){
		
		

		logger.info("userfake "+commentaire.id_user);
		logger.info("note "+commentaire.note);

		dao.insertcom(commentaire);

		place(commentaire.id_place ,  model,  session);
			return "place";
	
	}
	
//	@RequestMapping(value = "/note", method = RequestMethod.POST) //changer ca un de ces jouts
//	public String note(Commentaires commentaire, Model model, HttpSession session){
//		
//		
//
//		logger.info("note "+commentaire.note);
//
//		dao.insertcom(commentaire);
//
//		place(commentaire.id_place ,  model,  session);
//			return "place";
//	
//	}
	
	
	
}
