App.cable.subscriptions.create "PriceUpdateChannel",
  received: (data) ->
    color = if (data['direction'] == 'up') then '#90EE90' else '#FA8072'
    $("#price-for-" + data['stock_id'])
      .effect('highlight', { color: color }, 2000)
      .text(data['last_price'])