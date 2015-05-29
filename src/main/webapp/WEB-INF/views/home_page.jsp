<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html lang="fr">

<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>EasyPark</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	
<link href="<c:url value="/resources/home_page1.css" />" rel="stylesheet">

</head>

<body><br><br><br>

<script src="myFirstScript.js" type="text/javascript"> </script>

<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top ">
		<div class="container-fluid" >

			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
				<a class="navbar-brand page-scroll" href="#">Easy Park</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right"></ul>
  
			 	
			
				<ul class="nav navbar-nav navbar-right">
				
	
	
<c:catch var ="catchException">
   <% session.getAttribute("id_user").getClass();%>
</c:catch>

<c:if test = "${catchException != null}">
   	<li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#" ><span class="glyphicon glyphicon-user"></span>   Inscription</a>
					<ul class="dropdown-menu">
            			<li><a href="inscription?structur=0">En tant que particulier</a></li>
            			<li><a href="inscription?structur=1">En tant que entreprise</a></li>
          			</ul>
				</li>
		<li><a href="connexion"><span class="glyphicon glyphicon-log-in"></span>    Se connecter</a></li>

      <br />
</c:if>
<c:if test  = "${catchException == null}">
<li><a href="mon_profil">    <%= session.getAttribute("email")%></a></li>
 <li><a href="disconnect">Se déconnecter</a></li>
      <br />
</c:if>
		
		
			
</ul>
			</div>
		</div>
	
	</nav>
	


	
	
	
	
	
	
	
	
	
	
	
	<!-- La Recherche --> 
	<section id="recherche">
	<div class="container">
		
  <form class="form-inline" role="form">
  
  

    	  <div class="form-group1">
      		<label for="where">Où?</label>
      		<input type="text" class="form-control" id="where" placeholder="Entrez une adresse">
      		<span class="glyphicons glyphicons-google-maps"></span>
    	</div>
    
    	<div class="form-group">
      		<label for="when">Quand ?</label>
      		<input type="text" class="form-control" id="when" placeholder="Entrez une date">
      		<span class="glyphicon glyphicon-calendar"></span> 
    	</div>	
			<a href="rechercher_place" class="btn btn-info btn-lg">
			<span class="glyphicon glyphicon-search"></span> Rechercher</a>
			<a href="#" class="btn btn-info btn-md">
			<span class="glyphicon glyphicon-search"></span> Recherche avancée</a>
			
		</div>
		
	</form>
	
	
	</section>
	
	
	<!-- A votre service -->
	
	
	<section id="avotreservice">
	<div class="container">
		<div class="row">
		<div class="col-lg-12 text-center">
                    <h2 class="section-heading">A votre service</h2>
        </div>
        
         <div class="row text-center">
                <div class="col-md-4">
                <button type="button" class="btn btn-info btn-lg" onclick="window.location.href='/easypark/rechercher_place?oby=id&sort=asc'">Je veux un parking</button>
                    
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                </div>
                
                <div class="col-md-4"></div>
                <div class="col-md-4">
                 <button type="button" class="btn btn-info btn-lg" onclick="window.location.href='/easypark/ajouter_place'">Je prète un parking</button>
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                </div>
                
         	</div>
		</div>
	</div>
</section>


    
<!-- L'équipe -->
    <section id="team" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">L'équipe</h2>
                    <h3 class="section-subheading text-muted">Vous allez nous aimer.</h3>
                </div>
              
            </div>
            
            <div class="row">
            
               <div class="col-lg-12 text-center">
                        <img class=" img-circle" src="/resources/images/geektonic.png" alt=""   >
                        <h4 class="section-subheading text-muted">VERT TONIC.</h4>
                        <p class="text-muted">Designers & Développeurs</p>
               </div>
               
            </div>
            
        </div>
    </section>
    
    
    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading" id="contact1" >Contactez-nous !</h2>
                    <h3 class="section-subheading">Nous sommes plutôt sympas.</h3>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Votre Nom*" id="name" required data-validation-required-message="Entrez votre nom.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Votre Email *" id="email" required data-validation-required-message="Entrez votre adresse mail.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Votre Message *" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button id="boutonenvoyer" type="submit" class="btn btn-info btn-lg">Envoyer</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
    <nav class="navbar navbar-inverse" id="footeressai">
        <div class="container">
            <div class="row">
               
                 <div class="col-md-12">
                    <span class="copyright">Copyright &copy; 2015</span>
               
                </div>   
            </div>
        </div>
    </footer>
    
    

    
</body>


</html>

