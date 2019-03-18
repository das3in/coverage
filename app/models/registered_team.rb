class RegisteredTeam < ApplicationRecord
  belongs_to :team
  belongs_to :tournament

  POINTS_MULTIPLIER = 5

  def points
    wins * POINTS_MULTIPLIER
  end

  def matches
    Match.where("home_team_id=? OR away_team_id=?", id, id)
  end
end
