json.tournament do
  json.id @tournament.id
  json.name @tournament.name

  json.sets @tournament.tournament_sets do |set|
    json.name set.name

    json.matches set.matches do |match|
      json.id match.id
      json.homeTeam match.home_team.team.name
      json.awayTeam match.away_team.team.name
      json.homeTeamId match.home_team.id
      json.awayTeamId match.away_team.id
      json.round match.round
      json.current match.current
      json.completed match.completed
      json.day match.day
    end
  end

  json.field @tournament.field.bunkers do |bunker|
    json.id bunker.id
    json.name bunker.name
    json.top bunker.top
    json.left bunker.left
    json.rotation bunker.rotation
  end
end

