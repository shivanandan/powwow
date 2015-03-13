var loader = function(){

	var pl = $('#powwowloader');

	if (pl.length > 0) {
		pl.fadeOut('400', function() {
			pl.remove();
		});
	} else {
		var html = '<div id="powwowloader"><div id="loadingProgressG"><div id="loadingProgressG_1" class="loader"></div></div></div>';
		$('body').append(html);
	}
}

jQuery(document).ready(function($) {
	$('.load').click(function(){
		loader();
	});
});