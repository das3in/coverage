class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_one_attached :avatar

  has_many :registered_teams
  has_many :tournaments, through: :registered_teams
  has_many :rating_changes

  alias_attribute :rating, :current_pbsn_rating

  def slug_candidates
    "#{location}-#{name}"
  end

  def display_name
    location + "  " + name
  end

  def matches
    Match.where("home_team_id=? OR away_team_id=?", id, id)
  end

  def wins
    matches.where(winner: self)
  end

  def losses
    matches.where.not(winner: self)
  end
end
