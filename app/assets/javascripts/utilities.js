
function printReservation()
{
	var resCode = $('input[name="PrintReservationCodeValue"]').val()
	var popup = window.open('', '_blank', 'width=300,height=175')
	$.ajax({
	    url: "/print/" + resCode,
	    success: function ( data, status, XHR ) {
	        popup.document.open()
			popup.document.write(data)
			popup.document.close()
	    }
	});
	
}