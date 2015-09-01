$("#supplier_form").submit(function(){
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
	
	var check_address = checkaddress();
	if ( check_address < 2 ) {
		if (check_address === 0) {
			$("#addressspan").removeClass("input_success");
			$("#addressspan").addClass("input_failure");
			$("#addressspan").html("Insert an address!");
		}
		$("#address").focus();
		return false;
	}
	
	var check_email = checkemail();
	if ( check_email < 2 ) {
		if (check_email === 0) {
			$("#emailspan").removeClass("input_success");
			$("#emailspan").addClass("input_failure");
			$("#emailspan").html("Insert an email!");
		}
		$("#email").focus();
		return false;
	}
	
	var check_phone = checkphone();
	if ( check_phone < 2 ) {
		if (check_phone === 0) {
			$("#phonespan").removeClass("input_success");
			$("#phonespan").addClass("input_failure");
			$("#phonespan").html("Insert a phone number!");
		}
		$("#phone").focus();
		return false;
	}
	
	var check_nin = checknin();
	if ( check_nin < 2 ) {
		if (check_nin === 0) {
			$("#ninspan").removeClass("input_success");
			$("#ninspan").addClass("input_failure");
			$("#ninspan").html("Insert an acceptable code!");
		}
		$("#nin").focus();
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

function checkaddress() {
    var address = $("#address").val();
    var ck_address = /^[a-z0-9 ,.'-]+$/i;
	if (address === "") {
		$("#addressspan").removeClass("input_success");
		$("#addressspan").removeClass("input_failure");
		$("#addressspan").html("");
		return 0;
	}
	else if ( !ck_address.test( address  ) ) {
		$("#addressspan").removeClass("input_success");
		$("#addressspan").addClass("input_failure");
		$("#addressspan").html("Wrong input for address!");
		return 1;
	}
	else {
		$("#addressspan").removeClass("input_failure");
		$("#addressspan").addClass("input_success");
		$("#addressspan").html("Address OK!");
		return 2;
	}
}

/*---------------------------------------------------------------*/


function checkemail() {
    var email = $("#email").val();
	var ck_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if (email === "") {
		$("#emailspan").removeClass("input_success");
		$("#emailspan").removeClass("input_failure");
		$("#emailspan").html("");
		return 0;
	}
	else if ( !ck_email.test( email  ) ) {
		$("#emailspan").removeClass("input_success");
		$("#emailspan").addClass("input_failure");
		$("#emailspan").html("Not accepted email!");
		return 1;
	}
	else {
		$("#emailspan").removeClass("input_failure");
		$("#emailspan").addClass("input_success");
		$("#emailspan").html("Email OK!");
		return 2;
	}
}

/*---------------------------------------------------------------*/


function checkphone() {
    var phone = $("#phone").val();
    var ck_phone = /^[0-9 -]+$/i;
	if (phone === "") {
		$("#phonespan").removeClass("input_success");
		$("#phonespan").removeClass("input_failure");
		$("#phonespan").html("");
		return 0;
	}
	else if ( !ck_phone.test( phone  ) ) {
		$("#phonespan").removeClass("input_success");
		$("#phonespan").addClass("input_failure");
		$("#phonespan").html("Wrong input for phone!");
		return 1;
	}
	else {
		$("#phonespan").removeClass("input_failure");
		$("#phonespan").addClass("input_success");
		$("#phonespan").html("Phone OK!");
		return 2;
	}
}

/*---------------------------------------------------------------*/

function checknin() {
    var nin = $("#nin").val();
    var ck_nin = /^[0-9 -]+$/i;
	if (nin === "") {
		$("#ninspan").removeClass("input_success");
		$("#ninspan").removeClass("input_failure");
		$("#ninspan").html("");
		return 0;
	}
	else if ( !ck_nin.test( nin  ) ) {
		$("#ninspan").removeClass("input_success");
		$("#ninspan").addClass("input_failure");
		$("#ninspan").html("Wrong input!");
		return 1;
	}
	else {
		$("#ninspan").removeClass("input_failure");
		$("#ninspan").addClass("input_success");
		$("#ninspan").html("Number OK!");
		return 2;
	}
}

/*---------------------------------------------------------------*/




$(document).ready(function () {
		$("#name").bind( 'input propertychange', checkname );
		$("#address").bind('input propertychange', checkaddress);
		$("#email").bind( 'input propertychange', checkemail );
		$("#phone").bind( 'input propertychange', checkphone );
		$("#nin").bind( 'input propertychange', checknin );
});

