/**
 * 
 */
function addevent() {
	enableReservation = true;
}
function stopaddevent() {
	enableReservation = false;
}

function eventconfirm(event) {
	event.color = 'blue';
	event.status = 'confirmed'
	$('#calendar').fullCalendar('updateEvent', event);
	
	$('#calendar').fullCalendar('updateEvent', event);
    console.log("event id"+ event.id);
    $.ajax({
		type : "Get",
		url : "eventUpdate2",
		data : "event_id=" + event.id + "&event_color=" + "blue" + "&event_status=" +"confirmed",
		success : function(response) {
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}
function eventcancel(event) {
	event.color = 'rgb(215, 215, 215)';
	event.status = 'free';
	$('#calendar').fullCalendar('updateEvent', event);
    console.log("event id"+ event.id);
    $.ajax({
		type : "Get",
		url : "eventUpdate",
		data : "event_id=" + event.id + "&event_color=" + "rgb(215, 215, 215)" + "&event_status=" +"free" +"&event_title="+"Libre",
		success : function(response) {
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
function eventdelete(event) {

	$('#calendar').fullCalendar('removeEvents', event.id);
	
    console.log("event id"+ event.id);
    $.ajax({
		type : "Get",
		url : "deleteEvent",
		data : "event_id=" + event.id,
		success : function(response) {
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
	
	
}
function eventAsk(event) {
	event.color = 'green';
	event.status = 'pending';
	$('#calendar').fullCalendar('updateEvent', event);
	   $.ajax({
			type : "Get",
			url : "eventUpdate",
			data : "event_id=" + event.id + "&event_color=" + "green" + "&event_status=" +"pending" +"&event_title="+"null",
			success : function(response) {
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
}

function eventClickMine(event, element) {

	if (event.status == 'pending') {
		if (confirm("Confirmer la reservation : "  )) {
			eventconfirm(event);
		} else {
			eventcancel(event)
		}
	} else if (event.status == 'confirmed') {
		if (confirm("Annuler la reservation :")) {
			eventcancel(event);
		}

	} else if (event.status == 'free') {
		if (confirm("Supprimer la disponibilité ?")) {
			eventdelete(event);
		}
	}

}

function dayClickMine(date, jsEvent, view, id_place) {
	if (enableReservation) {

		var stime = document.getElementById('startHour').value;
		var etime = document.getElementById('endHour').value;


		
		if (etime <= stime) {
			document.getElementById("ValueError").style.display = "inline-block";

			return;
		}

		
		var sfulldate;
		
		var h = stime.substr(0, 2);
		var m = stime.substr(3, 2);

		var day2 = new Array();
		var daySource = new Object();
		daySource.title = "Libre";
		daySource.start = new Date(date);
	
		
		daySource.start.setHours(h, m);

		daySource.color = 'rgb(215, 215, 215)';

		var h = etime.substr(0, 2);
		var m = etime.substr(3, 2);
		daySource.end = new Date(date);
		daySource.end.setHours(h, m);

		day2.push(daySource);
//		
//		  console.log("daysource end"+ daySource.end);
//		  console.log("daysource start"+ daySource.start);

		daySource.start=formatDate(daySource.start);

		$.ajax({
			type : "Get",
			url : "ajaxtest",
			data : "title=" + daySource.title + "&color=" + daySource.color
					+ "&start=" + formatDate(daySource.start) + "&end=" + formatDate(daySource.end)
					+ "&id_user=" + 0 + "&id_place=" + id_place,
			success : function(response) {

				$('#result').html(response);
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});

		$('#calendar').fullCalendar('addEventSource', day2);

	} else {
		$('#calendar').fullCalendar('changeView', 'agendaDay')
		$('#calendar').fullCalendar('gotoDate', date);
	}
	// change the day's background color just for fun
	// $(this).css('background-color', 'grey');
	if (view.name != 'month')
		return;

}
function eventClickNotMine(event, element) {
	if (event.status == 'free') {
		if (confirm("Faire une demande de réservation ?")) {
			eventAsk(event);
		}
	} else if (event.status = 'pending') {
		if (confirm("Annuler la demande de réservation ?")) {
			eventcancel(event);
		}
	}
}

//String text = "2011-10-02 18:48:05";


function formatDate(jsdate){
	
	
	               var date = new Date(jsdate);
	               var day = date.getDate();
	               var month = date.getMonth()+1;
	               var year = date.getFullYear();
	               date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds()
	
	               var date = year+"-"+month+"-"+day+" "+date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
	               
	               return date;
	               
}
