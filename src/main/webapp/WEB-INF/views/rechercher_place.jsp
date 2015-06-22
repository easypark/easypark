<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/style1.css" />" rel="stylesheet"
	type="text/css" media="screen" />

<title>Rechercher une place</title>
</head>
<body>



	<table class="normal-table">
		<thead>
			<tr>
				<th>nom</th>
				<th>ville</th>
				<th>adresse</th>
				<th>commentaire</th>
				<th>proprietaire</th>
				<th>superficie</th>
				<th><a style="color:white"href="rechercher_place?oby=note&sort=${sort}">note</a></th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="record" items="${list}">
				<tr>
					<tr>
					
					<td><a href="place?id_place=${record.id}">${record.nom}</a> </td>
					<td>${record.ville}</td>
					<td>${record.adresse }</td>
					<td>${record.commentaire}</td>
					<td><a href="page_utilisateur?id_user=${record.id_user}">${record.id_user}</a></td>
	<td>${record.superficie}</td>
		<td>${record.note }</td>
	
				</tr>
				
 
			</c:forEach>

 
 </tbody>
 </table>
  <c:if test="${empty list }">
			 Désoler, il n'y a pas de résultats
			 </c:if>
 <br>
	<br>
	<br>
	<br>
 Petit Formulaire de recherche
 
 <form action="rechercher_place_advance" method="POST">
 Date : <input NAME = "date" TYPE ="text"  >
 Adresse : <input NAME="adresse" TYPE="text">
 Id User : <input NAME="id_user" TYPE="text">
	
	<INPUT TYPE="submit" value="Send">
	
 </form>
 
</body>
</html>