var init_friend_lookup;

init_friend_lookup = function() {
	$('#friend-lookup-form').on('ajax:before', function(event) {
		showSpinner();
		$('#friend-lookup-results').hide();
	});

	$('#friend-lookup-form').on('ajax:after', function(event) {
		hideSpinner();
	});
};

$(document).ready(function() {
	init_friend_lookup();
});