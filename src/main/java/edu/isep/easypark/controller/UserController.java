package edu.isep.easypark.controller;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

import edu.isep.easypark.DAOimpl;
import edu.isep.easypark.ParkingLotDAOimpl;
import edu.isep.easypark.model.Comment;
import edu.isep.easypark.model.Commentaires;
import edu.isep.easypark.model.ParkingLot;
import edu.isep.easypark.model.Reservation;
import edu.isep.easypark.model.User;
import edu.isep.easypark.model.UserInformations;

@Controller
@SessionAttributes("loggedUser")
public class UserController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	private DAOimpl dao;
	private ParkingLotDAOimpl dao2;

	public UserController() throws SQLException {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/Bean.xml");

		dao = (DAOimpl) context.getBean("easyparkDAO");
		dao2 = (ParkingLotDAOimpl) context.getBean("easyparkDAOpl");

	}
	
  

	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public String adduser(User user, UserInformations userinf, Model model) {

		
		logger.info("inserting user " + user.getEmail() + "firstname : "
				+ userinf.getFirstname());
	
		 
        System.out.println("MD5 in hex: " + md5(user.getPassword()));
		user.setPassword(md5(user.getPassword()));
        
		int statut = dao.insertUser(user, userinf);
		
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

	@RequestMapping(value = "/add_commentaire", method = RequestMethod.POST)
	public String addcom(Commentaires commentaire, Model model, HttpSession session){
		
		

		logger.info("id_user "+commentaire.getId_user());

		dao.insertcom(commentaire);
		
	
			userPage(model, session,commentaire.getId_user());
			return "page_utilisateur";


	}
	
	@RequestMapping(value = "/page_utilisateur", method = RequestMethod.GET)
	public String userPage(Model model, HttpSession session, @RequestParam("id_user") int user_id) {

		
		User user = (User) session.getAttribute("user");
		if(user_id==user.getId()){
			model.addAttribute("isMine",true);
		}
		
		UserInformations userInf = new UserInformations();
		userInf = dao.getUserInf(user_id);
		
		logger.info("Result of the query :  " + userInf.getFirstname());
		
		model.addAttribute("userInf",userInf);
		model.addAttribute("user_id",user_id);
		
		
		ParkingLot searchFor = new ParkingLot();


		List<ParkingLot> list = dao.fillParkingLot(user_id);
		model.addAttribute("list", list);

		model.addAttribute("searchFor", searchFor);
		
		Commentaires commentaire = new Commentaires();
		model.addAttribute("commentaire", commentaire);

		List<Comment> list2 = dao.fillComment("id_user",user_id);
		model.addAttribute("list2",list2);
		
		return "page_utilisateur";
	}

	@RequestMapping(value = "/mon_profil", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {

		int user_id = (Integer) session.getAttribute("id_user");
		userPage(model,  session, user_id);
		
		
		return "page_utilisateur";
	}
	

	
	public boolean isLoggedIn(){
		return true;
	}
	
	
	public static String md5(String input) {
        
        String md5 = null;
         
        if(null == input) return null;
         
        try {
             
        //Create MessageDigest object for MD5
        MessageDigest digest = MessageDigest.getInstance("MD5");
         
        //Update input string in message digest
        digest.update(input.getBytes(), 0, input.length());
 
        //Converts message digest value in base 16 (hex) 
        md5 = new BigInteger(1, digest.digest()).toString(16);
 
        } catch (NoSuchAlgorithmException e) {
 
            e.printStackTrace();
        }
        return md5;
    }
	
}
