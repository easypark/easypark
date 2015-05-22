<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<link href="<c:url value="/resources/js/fullcalendar.css" />" rel="stylesheet" type="text/css" media="screen" />
<%-- <link href="<c:url value="/resources/js/fullcalendar.print.css" />" rel="stylesheet" type="text/css" media="screen" /> --%>


<script src="<c:url value="/resources/js/lib/moment.min.js"/>"></script>
<script src="<c:url value="/resources/js/lib/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/fullcalendar.min.js"/>"></script>


<script>




	$(document).ready(function() {
		
		$('#calendar').fullCalendar({

			
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek'
			},
			defaultDate: '2015-02-12',
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
			    },
			dayClick: function(date, jsEvent, view) {

		        alert('Clicked on: ' + date.format());

		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

		        alert('Current view: ' + view.name);

		        // change the day's background color just for fun
		        $(this).css('background-color', 'red');

		    },
			    eventClick: function(event, element) {

			        event.title = "CLICKED!";

			        $('#calendar').fullCalendar('updateEvent', event);

			    }
		});
		

	});
	alert("hi");

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>
	<div id='calendar'></div>
	
</body>



</html>