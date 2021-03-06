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
	<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<link href="<c:url value="/resources/ajouter_place1.css" />" rel="stylesheet">
	
	<script>

function test(){

    var geocoder = new google.maps.Geocoder();

    var address = $( "#adress" ).val();
   // var espace = " ";
  // var ville = $( "#ville" ).val();
    //var adresse_ville = address+espace+ville

    geocoder.geocode( { 'address': address }, function(results, status) {

      if (status == google.maps.GeocoderStatus.OK) {

    	  $("#lat").val(results[0].geometry.location.lat());
    	//  $("#myForm").submit();
    	  $("#longi").val(results[0].geometry.location.lng());
        $("#myForm").submit();

          return true;
      }

      else {
        return false;
      }
    });

    }

</script>	
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
	
<!-- Ajouter une place -->

<section id="ajouterplace">
	<div class="container">

		<h1>Ajouter une place</h1>

		<form action="add" method="POST">

			<div class="form-group">
				<label for="nameplace">Nom de la place :</label> <input type="text"
					class="form-control" NAME="nom" id="nameplace" value="nomplace"
					placeholder="Visible uniquement par vous">
			</div>

				<div class="form-group">
				<label for="ville">Ville:</label> <input type="text"
					class="form-control" NAME="ville" "id="ville" value="villeplace"
					placeholder="Entrez la ville où se situe votre place">
			</div>

			<div class="form-group">
				<label for="adress">Adresse:</label> <input type="text"
					class="form-control" NAME="adresse" id="adress" value='adresseplace'
					placeholder="Entrez l'adresse de votre place">
			</div>

			<div class="form-group">
				<label for="superficie">Superficie:</label> <input type="text" NAME="superficie"
					class="form-control" id="superficie" value="superficieplace"
					placeholder="Entrez la superficie de votre place" >
			</div>

			<div class="form-group">
				<label for="color">Disponibilit�s:</label> <input type="text"  NAME="horaires"
					class="form-control" id="horaires" placeholder="Calendrier + Horaires" value=0>
			</div>
			
			<div class="form-group">
				<label for="color">Disponibilit�s:</label> <input type="text"  NAME="type"
					class="form-control" id="horaires" placeholder="Type de places" value="interieur">
			</div>
	
			<div class="form-group">
				<label for="comm">Commentaires:</label>
				<input class="form-control" id="commentaire" rows="3" value="commentaireplace" NAME="commentaire">
			</div>
			
		
<!-- 			<div class="form-group"> -->
<!-- 				<label for="parking">Photo du parking</label> <input type="file" -->
<!-- 					id="parking"> -->
<!-- 			</div> -->

			<div>
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li class="active"><a href="#">2</a></li>
				</ul>
			</div>

	<input type="hidden" id="lat" NAME="latitude" VALUE="0" >
			<input type="hidden" ID="longi" NAME="longitude" VALUE="0" >
			<input type="hidden" ID="id_user" NAME="id_user" VALUE="0" >

			<div>
				 
				<button onClick="return test()" type="submit" class="btn btn-info btn-md">Valider</button>
				<button type="reset" class="btn btn-info btn-md">Retourner � l'�tape pr�c�dente</button>
					
			</div>
			
			<div id="test11">
			<a href="rediriger">Vous souhaitez �galement emprunter une place ? Cliquez ici pour rentrer votre v�hicule </a>
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
        </nav>
    </footer>
    
</body>
</html>
