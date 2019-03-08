class Match < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :winner, class_name: "Team", optional: true
  belongs_to :tournament

  after_save :update_ratings

  enum round: ["Prelims", "Wild Card", "Quarterfinals", "Semifinals", "Finals"]

  def update_ratings
    if completed
      home_rc = home_team.rating_changes.new(
        old_rating: home_team.current_pbsn_rating,
        tournament: tournament,
        match_id: self.id,
      )
      away_rc = away_team.rating_changes.new(
        old_rating: away_team.current_pbsn_rating,
        tournament: tournament,
        match_id: self.id,
      )

      calculator = EloRatingCalculator.new(self)
      calculator.run

      home_rc.new_rating = home_team.current_pbsn_rating
      away_rc.new_rating = away_team.current_pbsn_rating

      home_rc.save
      away_rc.save
    end
  end
end
