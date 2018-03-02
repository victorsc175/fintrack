App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    $("#messages").effect('highlight', { color: "#FFFACD" }, 3000)
                  .text(data)
