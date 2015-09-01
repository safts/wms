var $selectRole = $("#selectRole"),
    $selection_based = $(".selection-based"),
    $selection_based_employee = $(".selection-based-employee"),
    $fieldset_active = $("#fieldset-active"),
    $fieldset_active_employee = $("#fieldset-active-employee");

    
$("#selectRole").change(function() {
    if ($selectRole.val() === 'Warehouse Administrator' || $selectRole.val() === 'Product Supplier' ) {
        $selection_based.removeAttr('disabled');
        $selection_based.attr('placeholder', 'Enabled').val('');
        $("#fieldset-active").css({"font-style":"normal", "font-weight": "bold"});
                
        $selection_based_employee.attr('disabled', '').val('');
        $selection_based_employee.attr('placeholder', 'Disabled').val('');
        $("#fieldset-active-employee").css({"font-style":"italic", "font-weight": "normal"});
    }
    else if ($selectRole.val() === 'Warehouse Employee') {
    	$selection_based_employee.removeAttr('disabled');
    	$selection_based_employee.attr('placeholder', 'Enabled').val('');
    	$("#fieldset-active-employee").css({"font-style":"normal", "font-weight": "bold"});
		    	
    	$selection_based.attr('disabled', '').val('');
    	$selection_based.attr('placeholder', 'Disabled').val('');
    	$("#fieldset-active").css({"font-style":"italic", "font-weight": "normal"});
    }
    
    else {
        $selection_based.attr('disabled', '').val('');
        $selection_based.attr('placeholder', 'Disabled').val('');
		$("#fieldset-active").css({"font-style":"italic", "font-weight": "normal"});
        
        $selection_based_employee.attr('disabled', '').val('');
        $selection_based_employee.attr('placeholder', 'Disabled').val('');
        $nameSelect1.attr('disabled', 'disabled');
		$("#fieldset-active-employee").css({"font-style":"italic", "font-weight": "normal"});
    }
}).change(); // added trigger to calculate initial state
