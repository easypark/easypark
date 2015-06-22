<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gestion des commentaires</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	
<!-- Home Page Back-Office CSS -->
<link href="<c:url value="/resources/commentaires_bo.css" />" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestion des commentaires</title>
</head>
<body>


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

<h2> Liste des commentaires utilisateurs</h2>	
<!-- Tableau comm utilisateurs -->
<section id="tableau">

<div class="responsive-table-line" style="margin:0px auto;max-width:1000px;">
    <table class="table">

        <thead>

            <tr>

                <th>Auteur</th>
                
				<th>Utilisateur noté</th>
				
				<th>Commentaire</th>
				
                <th>Date</th>
                
            </tr>

        </thead>

        <tbody>

            <tr>

                <td>Edouard Perret </td>
                
                <td>Pauline Frelot</td>

                <td>Pas assez bonne pour utiliser ma place</td>

                <td>12/06/2015</td>
                
                <td><button type="button" class="btn btn-danger">Supprimer le commentaire</button></td>
                
                
            </tr>

            <tr>

                <td>Capucine Edme</td>
                
                <td>Aurélie Martinet</td>

                <td>J'ai retrouvé plein de mégôts sur ma place, je suis scandalisée</td>

                <td>15/06/2015</td>
                
                <td><button type="button" class="btn btn-danger">Supprimer le commentaire</button></td>
                
            </tr>
            
        </tbody>

    </table>


</section>

<h2> Liste des commentaires places</h2>
	
<!-- Tableau comm des places-->
<section id="tableau2">

<div class="responsive-table-line" style="margin:0px auto;max-width:1000px;">
    <table class="table">

        <thead>

            <tr>

                <th>Auteur</th>
                
				<th>Place notée</th>
				
				<th>Commentaire</th>
				
                <th>Date</th>
                
            </tr>

        </thead>

        <tbody>
 <c:forEach var="list2" items="${list2}">
            <tr>

                <td>Clarisse Bolignano </td>
                
                <td>Place Edme</td>

                <td>${list2.content}</td>

                <td>${list2.date}</td>
                
                <td><button type="button" class="btn btn-danger">Supprimer le commentaire</button></td>
           

			</tr>
		</c:forEach>


</body>
</html>
            </tr>

            <tr>

                <td>Pauline Frelot</td>
                
                <td>Edouard Perret</td>

                <td>Trop petite</td>

                <td>21/06/2015</td>
                
                <td><button type="button" class="btn btn-danger">Supprimer le commentaire</button></td>
                
            </tr>
            
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

