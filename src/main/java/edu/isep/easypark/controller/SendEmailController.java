package edu.isep.easypark.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class SendEmailController {

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value ="/form",method = RequestMethod.GET)
	public String formEmail(HttpServletRequest request) {
		return "EmailForm";
	}
	
	
	@RequestMapping(value ="/sendEmail",method = RequestMethod.GET)
	public String doSendEmail(HttpServletRequest request) {
		
		// takes input from e-mail form
		String recipientAddress = "e_pe@hotmail.fr";
		String subject = "sujet";
		String message = "salut";
		

		
		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(recipientAddress);
		email.setSubject(subject);
		email.setText(message);
		
		// sends the e-mail
		mailSender.send(email);
		
		// forwards to the view named "Result"
		return "Result";
	}
	
	 @RequestMapping(value = "/sendAdminMail",method = RequestMethod.POST)
		public String sendAdminMail(HttpServletRequest request, Model model, HttpSession session) {
			
				 String Senderemail = request.getParameter("email");
					String motif = request.getParameter("motif");
					String message = request.getParameter("message");
				 
					SimpleMailMessage email = new SimpleMailMessage();

					email.setTo("e_pe@hotmail.fr");  //A remplacer par une adresse admin
					email.setSubject(motif);
					email.setText(message + "FROM: " + Senderemail);
					
					mailSender.send(email);
										
					
					
			return "home_page";
		}
}