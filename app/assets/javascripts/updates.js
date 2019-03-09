$(document).ready(function() {
  let currentURL = window.location.href;

  setInterval(function() {
    $.ajax({
      type: 'GET',
      url: '/tournaments/1/live_updates',
    });
  }, 3000);
});
