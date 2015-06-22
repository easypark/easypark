<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="<c:url value="/resources/js/lib/jquery.min.js"/>"></script>
<link href="<c:url value="/resources/utilisateurs_bo.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>



<title>Gestion utilisateur</title>
</head>

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
	function makeAdmin(id, role) {
		$.ajax({
			type : "Get",
			url : "makeAdmin",
			data : "user_id=" + id + "&role=" + role,
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
	<section id="navigation"> <nav
		class="navbar navbar-inverse navbar-fixed-right ">
	<div class="container-fluid">

		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar"></button>

			<a class="navbar-brand page-scroll" href="#">Back-Office Easy
				Park</a>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-user"></span>Gestion des utilisateurs</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-home"></span>Gestion des
						administrateurs</a></li>
				<li><a href=""><span class="glyphicon glyphicon-pencil"></span>Gestion
						des commentaires</a></li>
				<li><a href=""><span class="glyphicon glyphicon-pencil"></span>Gestion
						des places</a></li>
				<li><a href="deconnexion"><span
						class="glyphicon glyphicon-log-in"></span> Se déconnecter</a></li>
			</ul>
		</div>

	</div>

	</nav> </section>

	<h2>Liste des utilisateurs</h2>
	<!-- Tableau -->
	<section id="tableau">

	<div class="responsive-table-line"
		style="margin: 0px auto; max-width: 900px;">
		<table class="table">

			<thead>

				<tr>

					<th>ID</th>

					<th>Photo</th>

					<th>Prénom</th>

					<th>Nom</th>

					<th>Adresse Mail</th>

					<th>Notes</th>

				</tr>

			</thead>
			<c:forEach var="record" items="${list}">

				<tbody>

					<tr id=${record.id_user}>

						<td>${record.id_user}</td>

						<td><img class=" img-responsive"
							src="resources/images/clarisse.jpg" alt=""></td>

						<td>${record.name}</td>

						<td>${record.name}</td>

						<td>${record.email}</td>

						<td>7/10</td>

						<td><button type="button" class="btn btn-success">Contacter</button></td>

						<td><button type="button" class="btn btn-warning">Avertir</button></td>
					
						<c:choose>

							<c:when test="${record.role.equals('banni')}">
								<td><button type="button" class="btn btn-danger"
										onClick='makeAdmin("${record.id_user}","user")'>Réintégrer</button></td>

							</c:when>
							<c:otherwise>
								<td><button type="button" class="btn btn-danger"
										onClick='makeAdmin("${record.id_user}","banni")'>Bannir</button></td>

							</c:otherwise>
							</c:choose>
							<td><button type="button"
									onClick='erase("${record.id_user}")' class="btn btn-danger">Supprimer</button></td>

							<td><button onClick='makeAdmin("${record.id_user}","admin")' type="button" class="btn btn-info">Passer
									en Admin</button></td>
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


<%-- <%@include file="header.jsp" %> --%>


<!-- 	<table class="normal-table"> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th>Nom</th> -->
<!-- 				<th>Prénom</th> -->
<!-- 				<th>Email</th> -->
<!-- 				<th>Note</th> -->
<!-- 				<th>Role</th> -->
<!-- 				<th>Admin</th> -->
<!-- 				<th>Supprimer</th> -->

<!-- 			</tr> -->
<!-- 		</thead> -->
<%-- 		<c:forEach var="record" items="${list}"> --%>
<!-- 			<tbody> -->

<!-- 				<tr id=${record.id_user}> -->
<%-- 					<td>${record.name}</td> --%>
<%-- 					<td>${record.firstname}</td> --%>
<%-- 					<td>${record.email}</td> --%>
<!-- 					<td>Note</td> -->
<%-- 					<td>${record.role}</td> --%>
<%-- 					<c:choose> --%>



<%-- 		<c:when test="${record.role.equals('user')}"> --%>
<%-- 					<td><button onClick='makeAdmin("${record.id_user}","admin")'>Admin</button></td> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<%-- 					<td><button onClick='makeAdmin("${record.id_user}","user")'>User</button></td> --%>
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>



<%-- 					<td><button onClick='erase("${record.id_user}")'>Supprimer</button></td> --%>
<!-- 				</tr> -->
<%-- 		</c:forEach> --%>


<!-- 		</tbody> -->
<!-- 	</table> -->
<!-- </body> -->
<!-- </html> -->