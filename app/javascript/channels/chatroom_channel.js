import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected: function() {
    console.log("Connected to the chatroom!");
    console.log(" chatroom!");

    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
   
    // $("#usersTable").prepend("<%=escape_javascript render('user_row',user:@user)%>");

   $("#message-container").append(data.mod_message);
   $("#chat-text").val("");
    // Called when there's incoming data on the websocket for this channel
  }
}); 