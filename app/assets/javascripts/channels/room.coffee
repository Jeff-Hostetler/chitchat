App.room = App.cable.subscriptions.create "RoomChannel",

  connected: ->
  disconnected: ->
  received: (data) ->
    alert(data['text'])
  speak: (text)->
    @perform 'speak', text: text


  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return/enter = send
      App.room.speak(event.target.value)
      event.target.value = ''
      event.preventDefault()
