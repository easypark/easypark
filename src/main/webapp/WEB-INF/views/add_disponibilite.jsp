<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


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
<%out.print("daySource.color = ");%>'${record.status}';
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
				right: 'month,agendaDay'
			},

			editable: true,
			eventLimit: 2, // allow "more" link when too many events
			events: [		{ title: 'My Event',
			                 start: '2015-06-12',
			                 allDay: true,
			                 status    : 'Confirmed',
			                 color: 'red'

			},{title: 'My Event',
                start: '2015-02-02',
                allDay: true}
                
              
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
			   	if(event.color=='green'){
			   		if (confirm("Confirmer la reservation :")) {
			   		 eventconfirm(event);
			   		} 
			   		else{
			   			eventcancel(event)
			   		}
			   	}
			   	else if(event.color=='blue'){
			   		if( confirm("Annuler la reservation :")){
			   			eventcancel(event);
			   		}
			   		
					
			   	}
			   	else if(event.color=='rgb(215, 215, 215)'){
			   		if( confirm("Supprimer la disponibilité ?")){
			   			eventdelete(event);
			   		}
			   	}
			   	

		    },
			

		    
		});
		
		  $('#calendar').fullCalendar('addEventSource', day);
	});

	var enableReservation = false;
	var timepicker;
	
	function addevent() {
		enableReservation =true;	
	}
	function stopaddevent() {
		enableReservation =false;	
	}
	
	
	function eventconfirm(event){
 		   event.color = 'blue';
 	        $('#calendar').fullCalendar('updateEvent', event);

	}
	function eventcancel(event){
		 event.color = 'rgb(215, 215, 215)';
	        $('#calendar').fullCalendar('updateEvent', event);
	}
	function eventdelete(event){
		
		 $('#calendar').fullCalendar('removeEvents', event.id);
	}
	
	
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<h1>Agenda de la place : ${id_place }</h1>



	<div id='calendar'></div>
	
		HEURES :

	<button onclick="addevent()">Ajouter une disponibilité</button>
	<button onclick="stopaddevent()">Terminer</button>
	<br></br>
	start :
	<input type="text" class="timepicker" name="time" id="startHour">
		</br> end : <input type="text" class="timepicker" name="time" id="endHour">
			<span style="display: none; color: red" id="ValueError">La
				valeur de fin est inférieur à celle de début</span>
</body>

</html>

