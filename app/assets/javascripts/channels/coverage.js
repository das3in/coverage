App.coverage = App.cable.subscriptions.create('CoverageChannel', {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    if (data.content.blank == null) {
      $('#coverage-feed').append(
        '<div class="list-group-item d-flex justify-content-between align-items-center">' +
          '<span class="badge badge-primary badge-pill p-4" style="margin-right: 1em;">' +
          data.user +
          '</span>' +
          data.content +
          '</div>',
      );
      $('#micropost_content').val('');
    }
  },
});
