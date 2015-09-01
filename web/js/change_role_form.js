var $my_change_role_button = $(".my_change_role_button"),
	$my_delete_account_button = $("#my_delete_account_button"),
	
	$my_change_role_form = $("#my_change_role_form"),
	$my_select_role = $("#my_select_role"),
	$my_submit_change_role = $("#my_submit_change_role"),
	$my_cancel_change_role = $("#my_cancel_change_role"),
	$my_error_change_role = $("#my_error_change_role");

$my_change_role_button.click( function () {

	$my_change_role_form.show("fast");
	/*$my_change_role_form.css({"display": "inline"});*/
	/*$my_select_role.removeAttr('disabled');
	$("#my_select_role").refresh();
	$my_submit_change_role.removeAttr('disabled');
	$my_cancel_change_role.removeAttr('disabled');*/

    /*    $selection_based.attr('placeholder', 'Enabled').val('');
        $("#fieldset-active").css({"font-style":"normal", "font-weight": "bold"});*/

});



$("#my_cancel_change_role").click(function(event) {
	
	event.preventDefault();
	$my_change_role_form.hide("slow");
});


$("#my_submit_change_role").click(function(event) {
 
	if ( $("#my_select_role").val() == "none" ) {
		
		$("#my_error_change_role").show("slow");
		/*$my_error_change_role.css({"display": "inline"});*/
		return false;
	}
}).change();


$my_select_role.change( function(event) {

	$("#my_error_change_role").hide("slow");


}).change();






