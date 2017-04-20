App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function () {
    //This don't do anything, but I am leaving it here so I don't forget to investigate
  },
  disconnected: function () {
    //This don't do anything, but I am leaving it here so I don't forget to investigate
  },
  received: function (data) {
    $('#messages').append(data['message']);
  },
  speak: function (text) {
    return this.perform('speak', {
      text: text
    });
  }
}, $(document).on('keypress', '[data-behavior~=room_speaker]', function (event) {
  if (event.keyCode === 13) {
    App.room.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
}));
