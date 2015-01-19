function printOnDemand() {
	var resCode = $('input[name="PrintReservationCodeValue"]').val()
	printReservation(resCode);
}

function printOnRent() {

}

function printReservation(resCode)
{
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

function showCart()
{
	var email = $('input[name="ShowCartEmail"]').val()
	var popup = window.open('', '_blank', 'width=800,height=150')
	$.ajax({
	    url: "/show_cart/" + email,
	    success: function ( data, status, XHR ) {
	        popup.document.open()
			popup.document.write(data)
			popup.document.close()
	    }
	});
	
}