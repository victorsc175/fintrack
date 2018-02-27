$('#stock-lookup').replaceWith("<%= escape_javascript(render 'stocks/lookup') %>")
$('#stock-lookup-errors').replaceWith("<%= @stock ? '' : 'Stock was not found.' %>")

init_stock_lookup()