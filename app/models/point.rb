class Point < ApplicationRecord
  belongs_to :match
  belongs_to :winner, class_name: "RegisteredTeam", optional: true

  has_many :point_events

  def home_team
    match.home_team.team.name
  end

  def away_team
    match.away_team.team.name
  end
end
