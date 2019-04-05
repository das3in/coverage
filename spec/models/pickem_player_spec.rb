require "rails_helper"

describe PickemPlayer do
  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:pickem) }
    it { should have_many(:pickem_guesses) }
  end

  describe "#save" do
    it "creates empty, incomplete pickem_guesses for each match in the event" do
      tournament = setup_tournament
      pickem = create(:pickem, tournament: tournament)
      user = create(:user)

      pickem.users << user

      pickem_player = user.pickem_players.first
      expect(pickem_player).to be_present
      expect(pickem_player.pickem_guesses.count).to eq(2)
    end
  end

  def setup_tournament
    league = create(:league)
    t = create(:tournament, league: league)
    teams = [
      create(:team, :with_avatar, current_pbsn_rating: 1600),
      create(:team, :with_avatar, current_pbsn_rating: 1450),
      create(:team, :with_avatar, current_pbsn_rating: 1200),
      create(:team, :with_avatar, current_pbsn_rating: 1300),
    ]

    teams.each { |team| t.teams << teams }
    t.matches.create(
      home_team: t.registered_teams.first,
      away_team: t.registered_teams.last,
    )
    t.matches.create(
      home_team: t.registered_teams.second,
      away_team: t.registered_teams.third,
    )

    t
  end
end
