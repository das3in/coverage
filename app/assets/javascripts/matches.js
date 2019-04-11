const load_teams_from_division = () => {
  const tournamentId = $('#tournamentId').val();
  let division = $('#division-select').val();
  const request = `/tournaments/${tournamentId}/teams_for_division?division=${division}`;

  let aj = $.ajax({
    url: request,
    type: 'get',
    data: $(this).serialize(),
  })
    .done(data => {
      change_teams(data);
    })
    .fail(err => {
      console.log('Something messed up badly');
      console.log(err);
    });
};

const change_teams = data => {
  $('#match_home_team_id').empty();
  $('#match_away_team_id').empty();
  $('#match_winner_id').empty();

  data.map(team => {
    $('#match_home_team_id').append(
      $('<option></option>')
        .attr('value', team.id)
        .text(team.team.name),
    );
    $('#match_away_team_id').append(
      $('<option></option>')
        .attr('value', team.id)
        .text(team.team.name),
    );
    $('#match_winner_id').append(
      $('<option></option>')
        .attr('value', team.id)
        .text(team.team.name),
    );
  });
};

$(document).on('change', '#division-select', () => {
  load_teams_from_division();
});
