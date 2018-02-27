window.init_friend_lookup = ->
  $('#friend-lookup-form').on 'ajax:before', (event) ->
    showSpinner()
    $('#friend-lookup-results').hide()
    
  $('#friend-lookup-form').on 'ajax:after', (event) ->
    hideSpinner()

$(document).ready ->
  init_friend_lookup()
