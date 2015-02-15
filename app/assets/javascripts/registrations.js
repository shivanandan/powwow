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

	$('.areyouastudent input').click(function(){
		var k = $(this).val();
		$('.othersqs, .studentsqs').addClass('hide');
		$('.'+k).removeClass('hide');
	});

	$('.othersqs input').click(function(){
		var html = '<div class="form-group tttt"><input id="titleotherinput" type="text" name="users[title]" class="form-control ti" placeholder="Your current job title"></div>';
		
		if ($(this).hasClass('ti1')) {
			// This is to identify the others radio button
			$('.othersqs').append(html);
		} else if ($(this).hasClass('ti')) {
			// To Identify the new input box
		} else {
			// remove the html thing
			$('.tttt').remove()
		}
	});
}

$(document).ready(monitor_change_to_select);
$(document).on('page:load', monitor_change_to_select);