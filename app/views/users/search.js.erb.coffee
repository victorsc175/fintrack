$('#friend-lookup').replaceWith("<%= escape_javascript(render 'friends/lookup') %>")
$('#friend-lookup-errors').replaceWith("<%= @users.any? ? '' : 'User was not found.' %>")

init_friend_lookup()
$("#friend-lookup-results").fadeIn()