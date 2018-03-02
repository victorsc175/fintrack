App.cable.subscriptions.create "PriceUpdateChannel",
  received: (data) ->
    $("#price-for-" + data['stock_id'])
      .effect('highlight', { color: "#FFFFE0" }, 3000)
      .text(data['last_price'])