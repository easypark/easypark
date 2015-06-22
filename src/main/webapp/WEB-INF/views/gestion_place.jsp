<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/places_bo.css" />" rel="stylesheet">

<title>Gestion des places</title>
</head>
<script>
function erase(id){
    $.ajax({
		type : "Get",
		url : "erasePlace",
		data : "place_id=" + id,
		success : function(response) {
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
    document.getElementById(id).style.color = "grey";

}

</script>
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
<li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#" ><span class="glyphicon glyphicon-user"></span>Gestion des utilisateurs</a></li>
<li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#" ><span class="glyphicon glyphicon-home"></span>Gestion des administrateurs</a></li>
		<li><a href=""><span class="glyphicon glyphicon-pencil"></span>Gestion des commentaires</a></li>
		<li><a href=""><span class="glyphicon glyphicon-pencil"></span>Gestion des places</a></li>
		<li><a href="deconnexion"><span class="glyphicon glyphicon-log-in"></span> Se déconnecter</a></li>
				</ul>
			</div>
		
		</div>
	
	</nav>
	
</section>

<h2> Liste des places</h2>	


<section id="tableau">

<div class="responsive-table-line" style="margin:0px auto;max-width:900px;">
    <table class="table">

        <thead>

            <tr>

                <th>Nom</th>
                
				<th>Photo</th>
				
				<th>Adresse</th>
				
                <th>Ville</th>

                <th>Commentaire</th>

                <th>Propriétaire</th>
                
                <th>Note de la place</th>
                
            </tr>

        </thead>

    	<tbody>
			<c:forEach var="record" items="${list}">
				
					<tr id=${record.id}>
					
					<td><a href="place?id_place=${record.id}">${record.nom}</a> </td>
					<td>photo</td>
						<td>${record.adresse }</td>
					<td>${record.ville}</td>
				
					<td>${record.commentaire}</td>
					<td><a href="page_utilisateur?id_user=${record.id_user}">${record.id_user}</a></td>
		<td>${record.note }/10</td>
		                <td><button type="button" class="btn btn-danger" onClick='erase("${record.id}")'>Supprimer</button></td>
		
	
	
				</tr>
				
 
			</c:forEach>

 
 </tbody>

    </table>


</section>


 
 <!-- Footer -->
    <footer>
    <nav class="navbar navbar-inverse" id="footer">
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