App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    $("#messages").effect('highlight', { color: "#FFFFE0" }, 3000)
                  .text(data)
