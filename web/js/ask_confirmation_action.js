/*
function user_confirmation(event) {
	
	alert("dasdasdasdad");
	event.preventDefault();
	
	
	if($(this).next('div.question').length <= 0)
		$(this).after('<div class="question">Are you sure?<br/> <span class="btn btn-inverse popup yes">Yes</span><span class="btn btn-inverse popup cancel">Cancel</span></div>');
	
	$('.question').animate({opacity: 1}, 300);
	alert("eeeeeeeeeeeeeee");
	$('.yes').live('click', function(){
		window.location = thisHref;
		//$('.ask').form.submit();
		//$('#try_ask').submit();
		//e.submit();
		//return true;
		//$(this).submit();
	});
	
	$('.cancel').live('click', function(){
		$(this).parents('div.question').fadeOut(300, function() {
			$(this).remove();
		});
	});
	return false;
		
}*/
$(document).ready(function(){
	$('.ask').click(function(e) {

		e.preventDefault();
		var i = $(this).attr('id');
		//thisHref	= $(this).attr('href');

		if($(this).next('div.question').length <= 0)
			$(this).after('<div class="question">Are you sure?<br/> <span class="btn btn-inverse popup yes">Yes</span><span class="btn btn-inverse popup cancel">Cancel</span></div>');

		$('.question').animate({opacity: 1}, 300);

		$('.yes').live('click', function(){
			//window.location = thisHref;
			//$('.ask').form.submit();
			//$('#try_ask').submit();
			//e.submit();
			//return true;
			//$(this).submit();
			$("#myResults").html(i);
			var string = "#form" + i;
			$("#myResults").html(string);
			$(string).submit();
		});

		$('.cancel').live('click', function(){
			$(this).parents('div.question').fadeOut(300, function() {
				$(this).remove();
			});
		});

	});
});
