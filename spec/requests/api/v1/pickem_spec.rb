require "rails_helper"

describe "GET /api/v1/fantasy/:tournament" do
  it_behaves_like "authenticated endpoint", "GET", "/api/v1/fantasy/1"

  it "should return a list of matches in order for the selected tournament" do
    tournament = setup_tournament
  end

  def setup_tournament
    league = create(:league)
    tournament = create(:tournament, league: league)
    teams = [
      create(:team, current_pbsn_rating: 1600),
      create(:team, current_pbsn_rating: 1450),
      create(:team, current_pbsn_rating: 900),
      create(:team, current_pbsn_rating: 1200),
    ]
    teams.each { |team| tournament.teams << team }

    matches = [
      tournament.matches.create(
        home_team: tournament.registered_teams.first,
        away_team: tournament.registered_teams.second,
      ),
      tournament.matches.create(
        home_team: tournament.registered_teams.third,
        away_team: tournament.registered_teams.fourth,
      )
    ]

    matches.each { |m| PredictionGenerator.new(m).run }

    tournament
  end
end
