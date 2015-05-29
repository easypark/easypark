<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet"
	type="text/css" media="screen" />
<title>Page d'un utilisateur</title>
</head>
<body>
<h1>Profil de :</h1>
${user_id}
${userInf.name}
${userInf.firstname}

<br>
Informations:

<br><br>

Ses Places : <br>
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
 
 		<form action="add_commentaire" method="POST">
 		<input type="text" NAME="content"/>
 		<input style="display:none" value=<%=session.getAttribute("id_user")%> NAME='id_writter'/>
 		<input style="display:none" value=<%=request.getAttribute("user_id")%>  NAME='id_user'/> 
 		<input type="submit"/>
 	</form>
 	
 	<c:forEach var="list2" items="${list2}">

				<tr>
					<tr>
					<td>${list2.content}</td>
					<td>${list2.id_writter}</td>
					<td>${list2.date}</td>
					<br>
				</tr>
 	</c:forEach>
 	visiting current user <%=request.getAttribute("user_id")%>
</body>
</html>