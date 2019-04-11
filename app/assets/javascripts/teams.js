$(document).on('change', '#teams-division-select', () => {
  let request = `/teams?division=${$('#teams-division-select').val()}`;

  $.ajax({
    url: request,
    type: 'get',
  });
});
