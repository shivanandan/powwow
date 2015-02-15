function add_classes() {
	$('#error_explanation').addClass('alert alert-dismissible alert-warning');
	$('#error_explanation').prepend('<button type="button" class="close" data-dismiss="alert">×</button>')
}

$(document).ready(add_classes);
$(document).on('page:load', add_classes);
