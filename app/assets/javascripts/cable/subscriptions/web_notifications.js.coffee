App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    $('#messages').append @renderMessage(data)
    
    renderMessage: (data) ->
      "<p><b>[#{data.title}]:</b> #{data.body}</p>"
