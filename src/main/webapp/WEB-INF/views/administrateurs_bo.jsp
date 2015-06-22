<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html lang="fr">

<head>
<script>
	function erase(id) {
		$.ajax({
			type : "Get",
			url : "eraseUser",
			data : "user_id=" + id,
			success : function(response) {
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
		document.getElementById(id).style.color = "grey";

	}
	</script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gestion Administateurs</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	
<!-- Home Page Back-Office CSS -->
<link href="<c:url value="/resources/administrateurs_bo.css" />" rel="stylesheet">

</head>

<body>

<!-- Navigation horizontale -->
<section id="navigation">
	<nav class="navbar navbar-inverse navbar-fixed-right ">
		<div class="container-fluid" >

			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"data-target="#myNavbar"></button>
				
				<a class="navbar-brand page-scroll" href="#">Back-Office Easy Park</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
<li class=""><a class="dropdown-toggle"data-toggle="dropdown" href="#" ><span class="glyphicon glyphicon-user"></span>Gestion des utilisateurs</a></li>
<li class=""><a class="dropdown-toggle"data-toggle="dropdown" href="#" ><span class="glyphicon glyphicon-home"></span>Gestion des administrateurs</a></li>
		<li><a href="connexion"><span class="glyphicon glyphicon-pencil"></span>Gestion des commentaires</a></li>
		<li><a href="connexion"><span class="glyphicon glyphicon-pencil"></span>Gestion des places</a></li>
		<li><a href="deconnexion"><span class="glyphicon glyphicon-log-in"></span> Se déconnecter</a></li>
				</ul>
			</div>
		
		</div>
	
	</nav>
	
</section>

<h2> Liste des administrateurs</h2>	
<!-- Tableau -->
<section id="tableau">

<div class="responsive-table-line" style="margin:0px auto;max-width:1000px;">
    <table class="table">

        <thead>

            <tr>

                <th>ID</th>
				
                <th>Prénom</th>

                <th>Nom</th>

                <th>Adresse Mail</th>
                
            </tr>

        </thead>

        <tbody>

          <c:forEach var="record" items="${list}">

				<tbody>
					<tr id=${record.id_user}>

						<td>${record.id_user}</td>

						<td><img class=" img-responsive"
							src="resources/images/clarisse.jpg" alt=""></td>

						<td>${record.name}</td>

						<td>${record.name}</td>

						<td>${record.email}</td>


		           
                <td><button type="button" class="btn btn-info">Modifier les informations</button></td>
                
                <td><button type="button" class="btn btn-success">Contacter</button></td>
                
                <td><button onClick='erase("${record.id_user}")' type="button" class="btn btn-danger">Supprimer le compte</button></td>

					</tr>
			</c:forEach>
                
                   
        </tbody>

    </table>
    
	</section>
	


	<!-- Footer -->
	<footer> <nav class="navbar navbar-inverse" id="footer">
	<div class="container">
		<div class="row">

			<div class="col-md-12">
				<span class="copyright">Copyright &copy; 2015</span>

			</div>
		</div>
	</div></nav></footer>



</body>
</html>