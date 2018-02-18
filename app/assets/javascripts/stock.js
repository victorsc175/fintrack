var init_stock_lookup;

init_stock_lookup = function() {
	$('#stock-lookup-form').on('ajax:before', function(event) {
		showSpinner();
		$('#stock-lookup-results').hide();
	});

	$('#stock-lookup-form').on('ajax:after', function(event) {
		hideSpinner();
	});
};

$(document).ready(function() {
	init_stock_lookup();
});
