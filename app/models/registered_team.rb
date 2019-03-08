class RegisteredTeam < ApplicationRecord
  belongs_to :team
  belongs_to :tournament

  POINTS_MULTIPLIER = 5

  def points
    wins * POINTS_MULTIPLIER
  end
end
