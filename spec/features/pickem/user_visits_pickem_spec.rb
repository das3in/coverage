require "rails_helper"

describe "user visits a pickem competition" do
  it "should display a list of matches for the pickem event" do
    tournament = setup_tournament
    pickem = create(:pickem, tournament: tournament)

    visit pickem_path(pickem)

    expect(page).to have_content tournament.name
    expect(page).to have_content tournament.registered_teams.first.team.name
    expect(page).to have_content tournament.registered_teams.last.team.name
  end

  def setup_tournament
    league = create(:league)
    t = create(:tournament, league: league)
    teams = [
      create(:team, current_pbsn_rating: 1600),
      create(:team, current_pbsn_rating: 1450),
      create(:team, current_pbsn_rating: 1200),
      create(:team, current_pbsn_rating: 1300),
    ]

    teams.each { |team| t.teams << teams }
    t.matches.create(
      home_team: t.registered_teams.first,
      away_team: t.registered_teams.last,
    )

    t
  end
end
