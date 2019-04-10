json.tournament do
  json.id @tournament.id
  json.name @tournament.name

  json.matches @tournament.matches do |match|
    json.id match.id
    json.homeTeam match.home_team.team.name
    json.awayTeam match.away_team.team.name
    json.homeTeamId match.home_team.id
    json.awayTeamId match.away_team.id
    json.homeTeamScore match.home_team_score
    json.awayTeamScore match.away_team_score
    json.winner match.winner.team.name
    json.round match.round
    json.current match.current
    json.completed match.completed
    json.day match.day
  end

  json.field @tournament.field.bunkers do |bunker|
    json.id bunker.id
    json.name bunker.name
    json.top bunker.top
    json.left bunker.left
    json.rotation bunker.rotation
  end
end

