$( document ).ready(function() {
    $(".navbar-form").submit(function(e){
    	e.preventDefault();
    	$('#welcome').hide();
    	$('#loading-message').show();
    	var url = $(this).attr('action');
    	console.log(url);
    	var data = $(this).serialize();
    	console.log(data);
    	$.ajax({
    		url: url,
    		method: 'get',
    		data: data
    	}).done(function(response){
            $("#loading-message").hide()
    		$("#content").html(response)
    	})
    	});
});