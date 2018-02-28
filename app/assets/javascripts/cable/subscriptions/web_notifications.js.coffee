App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    $("#messages").prepend(data)
