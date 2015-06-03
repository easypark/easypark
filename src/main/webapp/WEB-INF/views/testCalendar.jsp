<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<link href="<c:url value="/resources/js/fullcalendar.css" />"
	rel="stylesheet" type="text/css" media="screen" />
<link href="<c:url value="/resources/jquery.timepicker.min.css" />"
	rel="stylesheet" type="text/css" media="screen" />

<%-- <link href="<c:url value="/resources/js/fullcalendar.print.css" />" rel="stylesheet" type="text/css" media="screen" /> --%>


<script src="<c:url value="/resources/js/lib/moment.min.js"/>"></script>
<script src="<c:url value="/resources/js/lib/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/fullcalendar.min.js"/>"></script>
<script src="<c:url value="/resources/js/moment.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.timepicker.min.js"/>"></script>

<script>

<%out.println(" var day = new Array();");
			out.println("	$(document).ready(function() {");%>
<c:forEach var="record" items="${list}">

<%out.println("var daySource = new Object();");
				out.print("daySource.title = ");%>"${record.title}";
<%out.print("daySource.start = new Date(");%>"${record.start}");
<%out.print("daySource.end = new Date(");%>"${record.end}");<%out.println("day.push(daySource);");%>




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
				right: 'month,agendaWeek,agendaDay'
			},

			editable: true,
			eventLimit: 2, // allow "more" link when too many events
			events: [		{ title: 'My Event',
			                 start: '2015-02-02',
			                 url: 'http://google.com/',
			                 allDay: true

			},{title: 'My Event',
                start: '2015-02-02',
                url: 'http://google.com/',
                allDay: true}
                
              
			],
			  eventClick: function(event) {
			        if (event.url) {
			            window.open(event.url);
			            alert(event.start);
			            return false;
			        }
			    },eventMouseover: function(event,date, calEvent, jsEvent) {
			    	
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
				
				
				if(enableReservation){
					var stime =  document.getElementById('startHour').value;	
					var etime =  document.getElementById('endHour').value;					

					if(etime <= stime) {alert("error"); 
					document.getElementById("ValueError").style.display="inline-block";
					
					return;}
					
					 var h = stime.substr(0,2);	
					 var m = stime.substr(3,2);

					 
					 
					var day2=new Array();
					var daySource = new Object();
					daySource.title = "Test2";
					daySource.start = new Date(date);
					daySource.start.setHours(h,m);	
					
					 var h = etime.substr(0,2);	
					 var m = etime.substr(3,2);
					daySource.end = new Date(date);
					daySource.end.setHours(h,m);	

					day2.push(daySource);
					
					
	 				 $('#calendar').fullCalendar('addEventSource', day2);	
				
				}
				else{
					 $('#calendar').fullCalendar('changeView', 'agendaDay')
  	               $('#calendar').fullCalendar('gotoDate', date);
				}
		        // change the day's background color just for fun
		        //$(this).css('background-color', 'grey');
		        	  if(view.name != 'month')   return;

			    

		    },
			    eventClick: function(event, element) {
			   // 	window.confirm("Annuler l'évènement ?"  + event.title)
			   $('#calendar').fullCalendar( 'gotoDate', event.date )
		       $('#calendar').fullCalendar('updateEvent', event);

		    },
			

		    
		});
		
		  $('#calendar').fullCalendar('addEventSource', day);
	});

	var enableReservation = true;
	var timepicker;
	
	function addevent() {
		enableReservation =true;	
	}
	function addevent2() {
		enableReservation =false;	
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

	HEURES :



	<button onclick="addevent2()">Ne plus ajouter</button>


	<div id='calendar'></div>
	start : <input type="text" class="timepicker" name="time" id="startHour"></br>
	end :	<input type="text" class="timepicker" name="time" id="endHour">
	<span style="display:none, color:red" id="ValueError">La valeur de fin est inférieur à celle de début</span>
</body>

</html>

