function datatable_it() {
	$('.datatable').DataTable({
		responsive: true
	  // ajax: ...,
	  // autoWidth: false,
	  // pagingType: 'full_numbers',
	  // processing: true,
	  // serverSide: true,

	  // Optional, if you want full pagination controls.
	  // Check dataTables documentation to learn more about available options.
	  // http://datatables.net/reference/option/pagingType
	});
}



$(document).ready(datatable_it);
$(document).on('page:load', datatable_it);
