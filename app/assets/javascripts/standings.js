$(document).on('change', '#standings-division-select', () => {
  let request = `/standings?division=${$('#standings-division-select').val()}`

  $.ajax({
    url: request,
    type: 'get',
  });
});
