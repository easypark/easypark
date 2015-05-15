<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet"
	type="text/css" media="screen" />
<title>Page personnelle</title>
</head>
<body>
<h1>Mon Profil</h1>
<%= session.getAttribute( "id_user" ) %>
<%= session.getAttribute( "email" ) %>

<br><br>
Ma gova :<br>

Mes Places : <br>
	<table class="normal-table">
		<thead>
			<tr>
				<th>nom</th>
				<th>ville</th>
				<th>commentaire</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="record" items="${list}">
				<tr>
					<tr>
					<td>${record.nom}</td>
					<td>${record.ville}</td>
					<td>${record.commentaire}</td>
				</tr>
				
 
			</c:forEach>

 
 </tbody>
 </table>
</body>
</html>