<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ajout voiture</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/ajouter_voiture.css">	
	
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
	
<!-- Ajouter une voiture -->

<section id="ajoutervoiture">
	<div class="container">

		<h2>Ajoutez votre v�hicule</h2>

		<form   action="addvoiture"  method="POST" >

			<div class="form-group">
				<label for="marque">Marque:</label> <input type="text"
					class="form-control" NAME="marque" id="marque"
					placeholder="Entrer la marque de votre v�hicule">
			</div>

			<div class="form-group">
				<label for="modele">Mod�le:</label> <input type="text"
					class="form-control" NAME="modele" id="modele"
					placeholder="Entrer le mod�le de votre v�hicule">
			</div>

			<div class="form-group">
				<label for="taille">Taille du v�hicule:</label> <input type="text"
					class="form-control" NAME="taille" id="taille"
					placeholder="Entrer la taille de votre v�hicule">
			</div>

			<div class="form-group">
				<label for="couleur">Couleur:</label> <input type="text"
					class="form-control" NAME="couleur" id="couleur"
					placeholder="Entrer la couleur de votre v�hicule">
			</div>

			<div class="form-group">
				<label for="cgrise">La carte grise</label> <input type="file"
					id="cgrise">
			</div>

			<div class="form-group">
				<label for="photov">Photographie de votre v�hicule</label> <input
					type="file" id="photov">
			</div>

			<div>
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li class="active"><a href="#">2</a></li>
				</ul>
			</div>

			<div>
				<button type="submit" class="btn btn-info btn-md">Valider</button>
				<button type="submit" class="btn btn-info btn-md">Retourner �
					l'�tape pr�c�dente</button>
			</div>
			
			<div id="test111">
			<a href="http://www.easypark_inscription.com/">Vous avez
					�galement un parking ? Cliquez ici </a> <br>
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