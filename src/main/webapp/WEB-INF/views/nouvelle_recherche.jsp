<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet"
	type="text/css" media="screen" />
<title>geoloc</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">



//Renvoie adresse quand on clique sur le form et transforme en longitutude et latitude
function test(form){
var geocoder = new google.maps.Geocoder();
var address = testResults(form);

geocoder.geocode( { 'address': address}, function(results, status) {

  if (status == google.maps.GeocoderStatus.OK) {
    var latitude = results[0].geometry.location.lat();
    var longitude = results[0].geometry.location.lng();
  
    initialiser(longitude,latitude);

  } 
}); 
}

</script>

				<SCRIPT LANGUAGE="JavaScript">

//renvoie ce qui a été entré dans le formulaire
function testResults (form) {	
    var TestVar = form.adress.value;
    return TestVar;    
}

		</script>
<SCRIPT LANGUAGE="JavaScript">	


<%out.println("var tab_longitude = [];");%>
<%out.println("var tab_latitude = [];");%>
<%out.println("var tab_nom = [];");%>
<%out.println("var tab_adresse = [];");%>
<%out.println("var tab_ville = [];");%>
<%out.println("var tab_superficie = [];");%>
<%out.println("var tab_horaires = [];");%>
<%out.println("var tab_type = [];");%>
<%out.println("var tab_commentaire = [];");%>
<%out.println("var tab_user = [];");%>
<c:forEach var="record" items="${list}">

<%out.println("tab_longitude.push("); %>"${record.longitude}"<%out.println(");"); %>
<%out.println("tab_latitude.push("); %>"${record.latitude}"<%out.println(");"); %>
<%out.println("tab_nom.push("); %>"${record.nom}"<%out.println(");"); %>
<%out.println("tab_adresse.push("); %>"${record.adresse}"<%out.println(");"); %>
<%out.println("tab_ville.push("); %>"${record.ville}"<%out.println(");"); %>
<%out.println("tab_superficie.push("); %>"${record.superficie}"<%out.println(");"); %>
<%out.println("tab_horaires.push("); %>"${record.horaires}"<%out.println(");"); %>
<%out.println("tab_type.push("); %>"${record.type}"<%out.println(");"); %>
<%out.println("tab_commentaire.push("); %>"${record.commentaire}"<%out.println(");"); %>
<%out.println("tab_user.push("); %>"${record.id_user}"<%out.println(");"); %>

</c:forEach>

			var maCarte;
			var zoneMarqueurs = new google.maps.LatLngBounds();

			function initialiser(longi, lati) {
							
				
				var map = new google.maps.Map(document.getElementById('carte'), {
				      zoom: 12,
				      center: new google.maps.LatLng( lati, longi ),
				      mapTypeId: google.maps.MapTypeId.ROADMAP
				    });

				    var infowindow = new google.maps.InfoWindow();

				    var marker, i;		   

				    for (var i = 0, I = tab_longitude.length -1 ; i <= I; i++ ) { 
		    	
				      marker = new google.maps.Marker({
				        position: new google.maps.LatLng(tab_latitude[i] , tab_longitude[i] ),
				        map: map
				      });				      
				     
				      google.maps.event.addListener(marker, 'click', (function(marker, i) {
				    	  
				        return function() {
				        	var nom = tab_nom[i];
					    	var adresse = tab_adresse[i];
					    	var ville = tab_ville[i];
					    	var superficie = tab_superficie[i];
					    	var horaires = tab_horaires[i];
					    	var type = tab_type[i];
					    	var commentaire = tab_commentaire[i];
					    	var user = tab_user[i];
					    	var lati = tab_latitude[i];
					    	var longi = tab_longitude[i];
					    	var qui_i = i ;
					    	var qui_I = I;
					    	
					    	var content = '<div class="map-content"><h3> Nom : ' + nom + '</h3> ' + '<br>' +
					    	'Adresse :' + adresse + ' ' + ville + '<br>'+
					    	'Superficie:'+ superficie + '<br>'+
					    	'Horaires :' + horaires + '<br>' +
					    	'Type: ' + type + '<br>' +
					    	'Commentaires : '+ commentaire + '<br>' +
					    	'Prêteur :' + user + '' ;
					    			
				          infowindow.setContent(content);
				          infowindow.open(map, marker);
				        }
				      })(marker, i));
				    }
			}
		
</SCRIPT>

</head>
<body>
	geoloc


	<div id="demo">Demo</div>


	<h1>Inscription</h1>
<!-- Juste pour aider lors du développement, il faudra virer ce tableau dans le vrai code -->
	<table class="normal-table">
		<thead>
			<tr>
				<th>nom</th>
				<th>ville</th>
				<th>adresse</th>
				<th>proprietaire</th>
				<th>longi</th>
				<th>lati</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="record" items="${list}">
			
				<tr>
				<tr>
					<td>${record.nom}</td>
					<td>${record.ville}</td>
					<td>${record.adresse}</td>
					<td><a href="page_utilisateur?id_user=${record.id_user}"
						.${record.id_user}>${record.id_user}</a></td>
						<td>${record.latitude}</td>
						<td>${record.longitude}</td>
					<input id="idEtape" value="${record.adresse}" type="hidden" />
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<br>
	<br>
	<br>
	<c:if test="${empty list }">
			 Désolé, il n'y a pas de résultats
			 </c:if>
	<form role="myform" method="GET">

		<div class="form-group">

			<label for="adress">Adresse:</label> <INPUT TYPE="text" NAME="adress"
				VALUE="">
			<P>
			<P>
		</div>

		<p></p>

		<INPUT TYPE="button" NAME="button" Value="Click"
			onClick="test(this.form)">
	</form>

	<div id="carte" style="width: 500px; height: 500px">hey</div>


</body>
</html>
