$("#checkform").submit(function(){
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
	
	
	var check_surname = checksurname();
	if ( check_surname < 2 ) {
		if (check_surname === 0) {
			$("#surnamespan").removeClass("input_success");
			$("#surnamespan").addClass("input_failure");
			$("#surnamespan").html("Insert a surname!");
		}
		$("#surname").focus();
		return false;
	}
	
	
	var check_username = checkusername();
	if ( check_username < 2 ) {
		if (check_username === 0) {
			$("#usernamespan").removeClass("input_success");
			$("#usernamespan").addClass("input_failure");
			$("#usernamespan").html("Insert a surname!");
		}
		$("#username").focus();
		return false;
	}
	
	
	var check_password = checkpassword();
	if (check_password === 0) {
		$("#passwordspan").removeClass("input_success");
		$("#passwordspan").addClass("input_failure");
		$("#passwordspan").html("Insert a password!");
		$("#password").focus();
		return false;
	}
	
	
	var check_confirmpassword = checkconfirmpassword();
	if (check_confirmpassword !== check_password) {
		$("#confirmpasswordspan").removeClass("input_success");
		$("#confirmpasswordspan").addClass("input_failure");
		$("#confirmpasswordspan").html("Confirm password!");
		$("#confirmpassword").focus();
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
	
	
	if ( ! ($("#checkbox1").is(':checked') ) ) {
		$("#checkbox1span").removeClass("input_success");
		$("#checkbox1span").addClass("input_failure");
		$("#checkbox1span").html("You have to confirm your personal data!");
		$("#checkbox1span").focus();
		return false;
	}
	
	if ( ! ($("#checkbox2").is(':checked') ) ) {
		$("#checkbox2span").removeClass("input_success");
		$("#checkbox2span").addClass("input_failure");
		$("#checkbox2span").html("You have to agree to terms & conditions!");
		$("#checkbox2span").focus();
		return false;
	}
	
	
	return true;
});



/*---------------------------------------------------------------*/




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

function checksurname() {
    var surname = $("#surname").val();
    var ck_surname = /^[a-z ,.'-]+$/i;
	if (surname === "") {
		$("#surnamespan").removeClass("input_success");
		$("#surnamespan").removeClass("input_failure");
		$("#surnamespan").html("");
		return 0;
	}
	else if ( !ck_surname.test( surname  ) ) {
		$("#surnamespan").removeClass("input_success");
		$("#surnamespan").addClass("input_failure");
		$("#surnamespan").html("Wrong input for surname!");
		return 1;
	}
	else {
		$("#surnamespan").removeClass("input_failure");
		$("#surnamespan").addClass("input_success");
		$("#surnamespan").html("Surname OK!");
		return 2;
	}
}

/*---------------------------------------------------------------*/

function checkusername() {
    var username = $("#username").val();
    var ck_username = /^[a-z ,.'-]+$/i;
	if (username === "") {
		$("#usernamespan").removeClass("input_success");
		$("#usernamespan").removeClass("input_failure");
		$("#usernamespan").html("");
		return 0;
	}
	else if ( !ck_username.test( username  ) ) {
		$("#usernamespan").removeClass("input_success");
		$("#usernamespan").addClass("input_failure");
		$("#usernamespan").html("Wrong input for surname!");
		return 1;
	}
	else {
		$("#usernamespan").removeClass("input_failure");
		$("#usernamespan").addClass("input_success");
		$("#usernamespan").html("Username OK!");
		return 2;
	}
}

/*---------------------------------------------------------------*/

function checkpassword() {
    var password = $("#password").val();
	if (password === "") {
		$("#passwordspan").removeClass("input_success");
		$("#passwordspan").removeClass("input_failure");
		$("#passwordspan").html("");
		return 0;
	}
	else {
		$("#passwordspan").removeClass("input_failure");
		$("#passwordspan").addClass("input_success");
		$("#passwordspan").html("Password OK!");
		return 2;
	}
}

/*---------------------------------------------------------------*/

function checkconfirmpassword() {
	var password = $("#password").val();
    var confirm_password = $("#confirm_password").val();
	if (confirm_password === "") {
		$("#confirmpasswordspan").removeClass("input_success");
		$("#confirmpasswordspan").removeClass("input_failure");
		$("#confirmpasswordspan").html("");
		return 0;
	}
	else if ( confirm_password !== password ) {
		$("#confirmpasswordspan").removeClass("input_success");
		$("#confirmpasswordspan").addClass("input_failure");
		$("#confirmpasswordspan").html("Confirmation password does not match!");
		return 1;
	}
	else {
		$("#confirmpasswordspan").removeClass("input_failure");
		$("#confirmpasswordspan").addClass("input_success");
		$("#confirmpasswordspan").html("Password Confirmed!");
		return 2;
	}
}

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

function checkcheckbox1() {
	
	if ( ! ( $("#checkbox1").is(':checked') ) ) {
		$("#checkbox1span").removeClass("input_success");
		$("#checkbox1span").removeClass("input_failure");
		$("#checkbox1span").html("");
		return 0;
	}
	else {
		$("#checkbox1span").removeClass("input_failure");
		$("#checkbox1span").addClass("input_success");
		$("#checkbox1span").html("Personal data confirmed!");
		return 2;
	}
}

/*---------------------------------------------------------------*/

function checkcheckbox2() {
	if ( ! ( $("#checkbox2").is(':checked') ) ) {
		$("#checkbox2span").removeClass("input_success");
		$("#checkbox2span").removeClass("input_failure");
		$("#checkbox2span").html("");
		return 0;
	}
	else {
		$("#checkbox2span").removeClass("input_failure");
		$("#checkbox2span").addClass("input_success");
		$("#checkbox2span").html("Terms & conditions accepted!");
		return 2;
	}
}

/*---------------------------------------------------------------*/

$(document).ready(function () {
		$("#name").bind( 'input propertychange', checkname );
		$("#surname").bind('input propertychange', checksurname);
		$("#username").bind('input propertychange', checkusername);
		$("#password").bind('input propertychange', checkpassword);
		$("#confirm_password").bind('input propertychange', checkconfirmpassword);
		$("#email").bind( 'input propertychange', checkemail );
		$("#checkbox1").bind( 'change', checkcheckbox1 );
		$("#checkbox2").bind( 'change', checkcheckbox2 );
});

