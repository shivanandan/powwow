function datatable_it() {
	$('.datatable').DataTable({
		responsive: true,
		"dom": 'T<"clear">lfrtip',
        "tableTools": {
            "sSwfPath": "http://cdn.datatables.net/tabletools/2.2.2/swf/copy_csv_xls_pdf.swf"
        },
        aLengthMenu: [
	        [25, 50, 100, 200, -1],
	        [25, 50, 100, 200, "All"]
	    ],
		iDisplayLength: -1

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