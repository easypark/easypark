<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Connexion</title>
</head>
<body>

	<form action="connect" method="POST">
		email:<INPUT TYPE="text" NAME="email" value="jim@mail.com"> <br> 
		password : <INPUT 	TYPE="text" NAME="password" value="safe"> <br>
			<INPUT TYPE="submit" value="Send">
</form>

   <button type="button"  onclick="window.location.href='/easypark/disconnect'">Deconnexion</button>
<br>
<%-- <%=session.getAttribute("id_user").getClass()%> --%>
<%= request.getAttribute("id_user") %>

	<c:catch var ="catchException">
   <% session.getAttribute("id_user").getClass();%>
</c:catch>

<c:if test = "${catchException != null}">
  not logged in
</c:if>
<c:if test  = "${catchException == null}">
<%= session.getAttribute("id_user") %>
</c:if>

<a href='home'>home page</a>


<%-- <jsp:useBean id="user"  name="user" type="edu.isep.easypark.User"/> --%>
<%-- <jsp:setProperty name="user"  value=${session.getAttribute("id_user")} />   --%>

<br><br><br><br>
<input type="text" value="${user_id}" />


</body>
</html>