<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Connexion</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="Connexion à mon application">
            <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
            
            <!-- CSS -->
            <link href="<c:url value="/resources/co.css" />" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
            <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:400,700,300" />
            <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
            <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<section id="navigation">
	<nav class="navbar navbar-inverse navbar-fixed-top ">
		<div class="container-fluid" >

			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
				<a class="navbar-brand page-scroll" href="#">Easy Park</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right"></ul>
  
			 	
			
				<ul class="nav navbar-nav navbar-right">
				
	
	
<c:catch var ="catchException">
   <% session.getAttribute("id_user").getClass();%>
</c:catch>

<c:if test = "${catchException != null}">
   	<li class="dropdown"><a class="dropdown-toggle" href="inscription?structur=0" ><span class="glyphicon glyphicon-user"></span>Inscription</a>
				</li>
      <br />
</c:if>
<c:if test  = "${catchException == null}">
<li><a href="myprofile">    <%= session.getAttribute("email")%></a></li>
 <li><a href="disconnect">Se déconnecter</a></li>
      <br />
</c:if>
		
		
			
</ul>
			</div>
		</div>
	
	</nav>
	
</section>
        
            <div class="container">
    <div class="row">
    <div class="col-xs-12">
        
        <div class="main">
                
            <div class="row">
            <div class="col-xs-12 col-sm-6 col-sm-offset-1">
                        
                <h1>Connexion</h1>
                <h2>Réservé aux inscrits</h2>
                        
                        
                <form action="connect" name="login" role="form" class="form-horizontal" method="POST" accept-charset="utf-8">
                  		<input type="text" NAME="role" value="user" style="display:none">
                    <div class="form-group">
                    <div class="col-md-8"><input name="email" placeholder="Adresse mail" class="form-control" type="text" id="UserUsername"/></div>
                    </div> 
                    
                    <div class="form-group">
                    <div class="col-md-8"><input name="password" placeholder="Mot de passe" class="form-control" type="password" id="UserPassword"/></div>
                    </div> 
                    
                    <div class="form-group">
                    <div class="col-md-offset-0 col-md-8"><input value="Send" class="btn btn-info btn-md" type="submit"/></div>
                    </div>
                
                </form>
                 <span style="color:red">${wrong}</span>
                <p class="credits">Développé par <a>Geek Tonic</a>.</p>
            </div>
            </div>
            
        </div>
    </div>
    </div>
    </div> 
    
   
        
        </body>
    </html>
    
    
    
    
    
<!-- 	<form action="connect" method="POST"> -->
<!-- 		email:<INPUT TYPE="text" NAME="email" value="jim@mail.com"> <br>  -->
<!-- 		password : <INPUT 	TYPE="text" NAME="password" value="safe"> <br> -->
<!-- 		<input type="text" NAME="role" value="user" style="display:none"> -->
<!-- 			<INPUT TYPE="submit" value="Send"> -->
<!-- </form> -->

<!--    <button type="button"  onclick="window.location.href='/easypark/disconnect'">Déconnexion</button> -->
<!-- <br> -->
<%-- <%-- <%=session.getAttribute("id_user").getClass()%> --%> --%>
<%-- <%= request.getAttribute("id_user") %> --%>

<%-- 	<c:catch var ="catchException"> --%>
<%--    <% session.getAttribute("id_user").getClass();%> --%>
<%-- </c:catch> --%>

<%-- <c:if test = "${catchException != null}"> --%>
<!--   not logged in -->
<%-- </c:if> --%>
<%-- <c:if test  = "${catchException == null}"> --%>
<%-- <%= session.getAttribute("id_user") %> --%>
<%-- </c:if> --%>

<!-- <a href='home'>home page</a> -->


<!-- <br><br> -->
<%-- ${wrong} --%>


<!-- </body> -->
<!-- </html> -->