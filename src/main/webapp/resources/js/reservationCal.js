/**
 * 
 */
function addevent() {
		enableReservation =true;	
	}
	function stopaddevent() {
		enableReservation =false;	
	}
	
	
	function eventconfirm(event){
 		   event.color = 'blue';
 		   event.status = 'confirmed'
 	        $('#calendar').fullCalendar('updateEvent', event);

	}
	function eventcancel(event){
		 event.color = 'rgb(215, 215, 215)';
		 event.status= 'free';
	        $('#calendar').fullCalendar('updateEvent', event);
	}
	function eventdelete(event){
		
		 $('#calendar').fullCalendar('removeEvents', event.id);
	}
	function eventAsk(event){
		event.color='green';
		event.status='pending';
	        $('#calendar').fullCalendar('updateEvent', event);

		
	}
	
	
	function  eventClickMine(event,element){
	   	if(event.status=='pending'){
	   		if (confirm("Confirmer la reservation :")) {
	   		 eventconfirm(event);
	   		} 
	   		else{
	   			eventcancel(event)
	   		}
	   	}
	   	else if(event.status=='confirmed'){
	   		if( confirm("Annuler la reservation :")){
	   			eventcancel(event);
	   		}
	   		
	   	}
	   	else if(event.status=='free'){
	   		if( confirm("Supprimer la disponibilité ?")){
	   			eventdelete(event);
	   		}
	   	}
	
	}
	
	
	function dayClickMine(date,jsEvent,view){
	if(enableReservation){
	var stime =  document.getElementById('startHour').value;	
	var etime =  document.getElementById('endHour').value;					

	if(etime <= stime) {
	document.getElementById("ValueError").style.display="inline-block";
	
	return;}
	
	 var h = stime.substr(0,2);	
	 var m = stime.substr(3,2);

	 
	 
	var day2=new Array();
	var daySource = new Object();
	daySource.title = "Libre";
	daySource.start = new Date(date);
	daySource.start.setHours(h,m);	
	daySource.color = 'rgb(215, 215, 215)'; 
	
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

}
	function  eventClickNotMine(event,element){
		
		if(confirm("Faire une demande de réservation ?")){
			eventAsk(event);
		}
		}
