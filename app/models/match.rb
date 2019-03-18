class Match < ApplicationRecord
  belongs_to :home_team, class_name: "RegisteredTeam"
  belongs_to :away_team, class_name: "RegisteredTeam"
  belongs_to :winner, class_name: "RegisteredTeam", optional: true
  belongs_to :tournament

  has_one :prediction, dependent: :destroy
  has_many :rating_changes, dependent: :destroy

  after_save :update_ratings, :update_scores

  enum round: ["Prelims", "Wild Card", "Quarterfinals", "Semifinals", "Finals"]

  def margin
    if winner == home_team
      home_team_score - away_team_score
    elsif winner == away_team
      away_team_score - home_team_score
    else
      0
    end
  end

  def update_ratings
    if completed
      home_rc = home_team.team.rating_changes.new(
        old_rating: home_team.team.current_pbsn_rating,
        tournament: tournament,
        match_id: self.id,
      )
      away_rc = away_team.team.rating_changes.new(
        old_rating: away_team..team.current_pbsn_rating,
        tournament: tournament,
        match_id: self.id,
      )

      calculator = EloRatingCalculator.new(self)
      calculator.run

      home_rc.new_rating = home_team.team.current_pbsn_rating
      away_rc.new_rating = away_team..team.current_pbsn_rating

      home_rc.save
      away_rc.save
    end
  end

  def update_scores
    if completed
      home_rt = home_team.registered_teams.find_by(tournament: tournament)
      away_rt = away_team.registered_teams.find_by(tournament: tournament)

      if winner == home_team
        home_rt.update(
          wins: home_rt.wins + 1,
        )

        away_rt.update(
          losses: away_rt.losses + 1,
        )
      end

      if winner == away_team
        home_rt.update(
          losses: home_rt.losses + 1,
        )

        away_rt.update(
          wins: away_rt.losses + 1,
        )
      end
    end
  end
end
