<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
<html lang="en">

<head>
<title>Inscription</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	
	<link href="<c:url value="/resources/ajouter_place1.css" />" rel="stylesheet">
</head>

<body>

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
					<li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span>   Inscription</a>
					<ul class="dropdown-menu">
            			<li><a href="formulaire_inscription.html">En tant que particulier</a></li>
            			<li><a href="formulaire_inscription.html">En tant que entreprise</a></li>
          			</ul>
				</li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>    Se connecter</a></li>
				</ul>

			</div>
		</div>
	</nav>
	
	
	
<!--Formulaire -->

    <section id="inscription1">

	<div class="container">
	<h1>Inscription</h1>
		<form role="form" action="adduser" method="POST">
		
			<div class="form-group" >
			
				<label for="lastname">Nom:</label> <input type="text" NAME="name"
					class="form-control" id="name"
					placeholder="Entrez votre nom">
			</div>

			<div class="form-group">
				<label for="firstname">Pr�nom:</label> <input type="text" NAME="firstname"
					class="form-control" id="firstname"
					placeholder="Entrez votre pr�nom">
			</div>

			<div class="form-group">
				<label for="email">Adresse email:</label> <input type="email"
					class="form-control" NAME="email" id="email" placeholder="Entrez votre adresse email">
			</div>

			<div class="form-group">
				<label for="pwd">Mot de passe:</label> <input type="password"
					class="form-control" NAME="password"id="pwd" placeholder="Entrez votre mot de passe">
			</div>

			<div class="form-group">
				<label for="confirm">Confirmation:</label> <input
					type="password" class="form-control" id="confirm"
					placeholder="Confirmez votre mot de passe">
			</div>

			
			<div class="form-group">
			<label for="photo">Photo de profil</label>
			<input type="file" id="photo">
			</div>
			
			<div class="checkbox">
				<label><input type="checkbox"> J'accepte les conditions d'utilisation du site Internet </label>
			</div>

			<div>
			<ul class="pagination">
				<li class="active"><a href="#">1</a></li>
				<li><a href="ajouter_place.html">2</a></li>
			</ul>
			</div>
			
			<div>
			<button type="submit" class="btn btn-info btn-md">Valider</button>
			<button type="submit" class="btn btn-info btn-md">Retour � l'accueil</button>
			</div>
			
		</form>
		
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
