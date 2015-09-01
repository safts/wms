$("#wharehouse_form").submit(function(){
	var check_name = checkname();
	if ( check_name < 2 ) {
		if (check_name === 0) {
			$("#namespan").removeClass("input_success");
			$("#namespan").addClass("input_failure");
			$("#namespan").html("Insert a name!");
		}
		$("#name").focus();
		return false;
	}
	
	var check_location = checklocation();
	if ( check_location < 2 ) {
		if (check_location === 0) {
			$("#locationspan").removeClass("input_success");
			$("#locationspan").addClass("input_failure");
			$("#locationspan").html("Insert a location!");
		}
		$("#location").focus();
		return false;
	}
	
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


function checkname() {
    var name = $("#name").val();
    var ck_name = /^[a-z ,.'-]+$/i;
	if (name === "") {
		$("#namespan").removeClass("input_success");
		$("#namespan").removeClass("input_failure");
		$("#namespan").html("");
		return 0;
	}
	else if ( !ck_name.test( name  ) ) {
		$("#namespan").removeClass("input_success");
		$("#namespan").addClass("input_failure");
		$("#namespan").html("Wrong input for name!");
		return 1;
	}
	else {
		$("#namespan").removeClass("input_failure");
		$("#namespan").addClass("input_success");
		$("#namespan").html("Name OK!");
		return 2;
	}
}

/*---------------------------------------------------------------*/

function checklocation() {
    var location = $("#location").val();
    var ck_location = /^[a-z0-9 ,.'-]+$/i;
	if (location === "") {
		$("#locationspan").removeClass("input_success");
		$("#locationspan").removeClass("input_failure");
		$("#locationspan").html("");
		return 0;
	}
	else if ( !ck_location.test( location  ) ) {
		$("#locationspan").removeClass("input_success");
		$("#locationspan").addClass("input_failure");
		$("#locationspan").html("Wrong input for location!");
		return 1;
	}
	else {
		$("#locationspan").removeClass("input_failure");
		$("#locationspan").addClass("input_success");
		$("#locationspan").html("Location OK!");
		return 2;
	}
}


/*---------------------------------------------------------------*/

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
		$("#name").bind( 'input propertychange', checkname );
		$("#location").bind('input propertychange', checklocation);
		$("#description").bind('input propertychange', checkdescription);
});


