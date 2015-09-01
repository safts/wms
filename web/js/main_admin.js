$(document).ready(function () {
		$(".disabled_input").attr('disabled','disabled');
});

$("#edit_pers_info_but").click( function(){
	
	$(".disabled_input").removeAttr('disabled');
	$("#first_input").focus();
	$(".disabled_input").css({"box-shadow":"0px 1px 4px 1px grey", "border-color":"#43C4EF"});
	$(".font_change").css("font-weight","bold");
	$("#submit_but").show("slow");
	$("#cancel_but").show("slow");
});

$("#cancel_but").click( function(){
	$(".disabled_input").attr('disabled','disabled');
	$("#first_input").blur();
	$(".disabled_input").css({"box-shadow":"0px 1px 1px rgba(0, 0, 0, 0.075) inset", "border-color":"rgb(221, 221, 221)"});
	$(".font_change").css("font-weight","normal");
	$("#submit_but").hide("slow");
	$("#cancel_but").hide("slow");
});