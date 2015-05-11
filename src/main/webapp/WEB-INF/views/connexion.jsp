<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
logged id:
 ${loggedUser.email}
<a href=''>home page</a>
</body>
</html>