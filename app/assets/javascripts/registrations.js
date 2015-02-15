function action_on_nations(selected) {
	if (selected != 'IN') {
		$('#nonindian input').prop('required',true);
		$('#nonindian textarea').prop('required',true);
		$('#nonindian select').prop('required',true);
		$('#nonindian input').prop('disabled',false);

		// making sure PIO and OCI remain not required
		$('#user_pio').prop('required',false);
		$('#user_oci').prop('required',false);

		$('#nonindian textarea').prop('disabled',false);
		$('#nonindian select').prop('disabled',false);
		$('#nonindian').css('display', 'block');
		$('#nonindian').animate({'opacity': 1}, 500, function(){
		});
	} else {
		$('#nonindian input').prop('required',false);
		$('#nonindian textarea').prop('required',false);
		$('#nonindian select').prop('required',false);
		$('#nonindian input').prop('disabled',true);
		$('#nonindian textarea').prop('disabled',true);
		$('#nonindian select').prop('required',false);
		$('#nonindian').animate({'opacity': 0}, 500, function(){
			$(this).css('display', 'none');
		});
	}
}


function monitor_change_to_select() {
	action_on_nations($('#nationstate #nationality').val());
	$('#nationstate #nationality').change(function(){
		var selectedvalue = $(this).val();
		action_on_nations(selectedvalue);
	});
}

$(document).ready(monitor_change_to_select);
$(document).on('page:load', monitor_change_to_select);