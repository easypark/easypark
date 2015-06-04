<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<link href="<c:url value="/resources/js/fullcalendar.css" />"
	rel="stylesheet" type="text/css" media="screen" />
<link href="<c:url value="/resources/jquery.timepicker.min.css" />"
	rel="stylesheet" type="text/css" media="screen" />

<script src="<c:url value="/resources/js/lib/moment.min.js"/>"></script>
<script src="<c:url value="/resources/js/lib/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/fullcalendar.min.js"/>"></script>
<script src="<c:url value="/resources/js/moment.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.timepicker.min.js"/>"></script>
<script src="<c:url value="/resources/js/reservationCal.js"/>"></script>
<script>

<%out.println(" var day = new Array();");
			out.println("	$(document).ready(function() {");%>
<c:forEach var="record" items="${list}">

<%out.println("var daySource = new Object();");
				out.print("daySource.title = ");%>"${record.title}";
<%out.print("daySource.start = new Date(");%>"${record.start}");
<%out.print("daySource.end = new Date(");%>"${record.end}");
<%out.print("daySource.id_place = ");%>"${record.id_place}";
<%out.print("daySource.id = ");%>"${record.id}";
<%out.print("daySource.id_user = ");%>"${record.id_user}";
<%out.print("daySource.status = ");%>'${record.status}';
<%out.print("daySource.color = ");%>'${record.color}';

<%out.println("day.push(daySource);");%>




</c:forEach>


$(document).ready(function(){
    $('input.timepicker').timepicker({'timeFormat': 'HH:mm' }
    );
    
});
	
		$('#calendar').fullCalendar({
			  height: 450,
			  witdh: 350,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaDay',
			    disableDragging: true,
			    editable: false
	
			},

			editable: true,
			eventLimit: 2, // allow "more" link when too many events
			events: [	
                
              
			],
			 eventMouseover: function(event,date, calEvent, jsEvent) {
			    	
			    	var start=moment(event.start).format('Do MMMM YYYY, h:mm');
			    	var end=moment(event.end).format('Do MMMM YYYY, h:mm');
	            
			    	var tooltip = 
			        '<div class="tooltipevent" style="width:200px;height:50px;background:#ccc;position:absolute;z-index:10001;">' +
			       "Start : "+ start + '<br> End : '+end+'</div>';
			        
			        $("body").append(tooltip);
			        $(this).mouseover(function(e) {
			     	    $(this).css('z-index', 10000);
			            $('.tooltipevent').fadeIn('500');
			            $('.tooltipevent').fadeTo('10', 1.9);
			        }).mousemove(function(e) {
			            $('.tooltipevent').css('top', e.pageY + 10);
			            $('.tooltipevent').css('left', e.pageX + 20);
			        });
			    },

			    eventMouseout: function(calEvent, jsEvent) {
			        $(this).css('z-index', 8);
			        $('.tooltipevent').remove();
			    },
			    

			dayClick: function(date, jsEvent, view) {
				
				dayClickMine(date,jsEvent,view);

		    },
			    eventClick: function(event, element) {
			  // 	window.confirm("Annuler l'évènement ?"  + event.status)
// 			   $('#calendar').fullCalendar( 'gotoDate', event.date )
// 		       $('#calendar').fullCalendar('updateEvent', event);
			  
			  if(${isMine}){
			    	 eventClickMine(event,element);

			  }else{
			    	 eventClickNotMine(event,element);

			  }
			  
			
			    },

		    
		});
		
		  $('#calendar').fullCalendar('addEventSource', day);
	});

	var enableReservation = false;
	var timepicker;
	
	
	
</script>



	<link href="<c:url value="/resources/style1.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page d'une place</title>
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
   
${action}<br>
  
     <c:choose>
      <c:when test="${isMine==true}">
<a href='#'>Modifier les information de votre place</a>    <br />
      </c:when>
       <c:otherwise>	
 <a href="">Demander une reservation</a><br>
      </c:otherwise>
   </c:choose>
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
<br></br>
<div id='calendar' ></div>
	     <c:choose>
      <c:when test="${isMine==true}">
	<button onclick="addevent()">Ajouter une disponibilité</button>
	<button onclick="stopaddevent()">Terminer</button>
	<br></br>
	start :
	<input type="text" class="timepicker" name="time" id="startHour">
		</br> end : <input type="text" class="timepicker" name="time" id="endHour">
			<span style="display: none; color: red" id="ValueError">La
				valeur de fin est inférieur à celle de début</span>
      </c:when>
   </c:choose>
		


</body>
</html>