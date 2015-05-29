<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

${id_place}
${place.nom}
${hasvoted}


 		<form action="add_commentaire2" method="POST">
 		<input type="text" NAME="content"/>
 		<input style="display:none" value=<%=session.getAttribute("id_user")%> NAME='id_writter'/>
  		<input style="display:none" value=<%=request.getAttribute("id_place")%>  NAME='id_place'/>  

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
 	
 	   id place <%=request.getAttribute("id_place")%>
   
 	
 	<c:choose>
      <c:when test="${hasvoted==true}">
      vous avez deja voter pour cette place
      <br />
      </c:when>
   

      <c:otherwise>		<form action="add_commentaire2" method="POST">
 		<input type="text" NAME="note"/>
 		<input style="display:none" value=<%=session.getAttribute("id_user")%> NAME='id_writter'/>
 		<input type="submit"/>
 	</form>
      
      </c:otherwise>
</c:choose>

note : ${note}


</body>
</html>