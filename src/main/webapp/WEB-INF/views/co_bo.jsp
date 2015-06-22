<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html lang="fr">

        
        <head>
            <meta charset="utf-8">
            <title>Connexion Back-Office</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="Connexion à mon application">
            <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
            
            <!-- CSS -->
            <link href="<c:url value="/resources/co_bo.css" />" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
            <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:400,700,300" />
            <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
            <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        </head>
        
        
        
        <body>
        
            <div class="container">
    <div class="row">
    <div class="col-xs-12">
        
        <div class="main">
                
            <div class="row">
            <div class="col-xs-12 col-sm-6 col-sm-offset-1">
                        
                <h1>Connexion</h1>
                <h2>Réservé aux administrateurs</h2>
                
                        
                <form action="connect" name="login" role="form" class="form-horizontal" method="POST" accept-charset="utf-8">
                    <div class="form-group">
                    <div class="col-md-8"><input NAME="email" placeholder="Idenfiant" class="form-control" type="text" id="UserUsername"/></div>
                    </div> 
                    
                    <div class="form-group">
                    <div class="col-md-8"><input NAME="password" placeholder="Mot de passe" class="form-control" type="password" id="UserPassword"/></div>
                    </div> 
                    
                    <div class="form-group">
                    <div class="col-md-offset-0 col-md-8"><input  class="btn btn-success btn btn-success" type="submit" value="Connexion"/></div>
                    </div>
                		<input type="text" NAME="role" value="admin" style="display:none">
                
                </form>
                <p class="credits">Développé par <a>Geek Tonic</a>.</p>
            </div>
            </div>
            
        </div>
    </div>
    </div>
    </div> 
    
   
        
        </body>
    </html>