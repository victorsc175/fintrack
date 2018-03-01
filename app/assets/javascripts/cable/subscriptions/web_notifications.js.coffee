App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    $("#messages").text(data)
