import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    debugger
    var user_id = parseInt($('input[name="current_user"]').val());
   	var id = data.id;
    if (user_id == data.user){
   	  $('#conversation-'+id).append('<li>'+'<div class = "row">'+'<div class = "message-sent">'+data.content+'</div>'+'</div>'+'</li>')
    }else{
      $('#conversation-'+id).append('<li>'+'<div class = "row">'+'<div class = "message-received">'+data.content+'</div>'+'</div>'+'</li>')
    }
  }
});
