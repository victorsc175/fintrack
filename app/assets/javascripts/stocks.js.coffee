window.init_stock_lookup = ->
  $('#stock-lookup-form').on 'ajax:before', (event) ->
    $('#spinner').show()
    $('#stock-lookup-results').hide()
    
  $('#stock-lookup-form').on 'ajax:after', (event) ->
    $('#spinner').hide()

$(document).ready ->
  init_stock_lookup()
