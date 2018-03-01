App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    $("#messages").effect('highlight', { color: "#F0FFF0" }, 3000).text(data)
