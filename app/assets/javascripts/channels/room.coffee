App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	#changes the cell of the table of people
  	$('#customers').find('tr#'+data.username+data.id).find('td:eq(1)').html(data.content);
    # Called when there's incoming data on the websocket for this channel
