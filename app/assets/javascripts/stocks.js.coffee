window.init_stock_lookup = ->
  $('#stock-lookup-form').on 'ajax:before', (event) ->
    showSpinner()
    $('#stock-lookup-results').hide()
    
  $('#stock-lookup-form').on 'ajax:after', (event) ->
    hideSpinner()

$(document).ready ->
  init_stock_lookup()
