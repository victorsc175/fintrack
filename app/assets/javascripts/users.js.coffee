window.init_friend_lookup = ->
  $('#friend-lookup-form').on 'ajax:before', (event) ->
    $('#spinner').show()
    $('#friend-lookup-results').hide()
    
  $('#friend-lookup-form').on 'ajax:after', (event) ->
    $('#spinner').hide()

$(document).ready ->
  init_friend_lookup()
