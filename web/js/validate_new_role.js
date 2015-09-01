$("#wharehouse_form").submit(function(){
	var check_description = checkdescription();
	if ( check_description < 2 ) {
		if (check_description === 0) {
			$("#descriptionspan").removeClass("input_success");
			$("#descriptionspan").addClass("input_failure");
			$("#descriptionspan").html("Insert a description!");
		}
		$("#description").focus();
		return false;
	}
	
	return true;
});


function checkdescription() {
    var description = $("#description").val();
    var ck_description = /^[a-z0-9 ,.'-]+$/i;
	if (description === "") {
		$("#descriptionspan").removeClass("input_success");
		$("#descriptionspan").removeClass("input_failure");
		$("#descriptionspan").html("");
		return 0;
	}
	else if ( !ck_description.test( description  ) ) {
		$("#descriptionspan").removeClass("input_success");
		$("#descriptionspan").addClass("input_failure");
		$("#descriptionspan").html("Wrong input for description!");
		return 1;
	}
	else {
		$("#descriptionspan").removeClass("input_failure");
		$("#descriptionspan").addClass("input_success");
		$("#descriptionspan").html("Description OK!");
		return 2;
	}
}


/*---------------------------------------------------------------*/



$(document).ready(function () {
		$("#description").bind('input propertychange', checkdescription);
});










