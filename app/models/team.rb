class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_one_attached :avatar

  has_many :registered_teams, dependent: :destroy
  has_many :tournaments, through: :registered_teams
  has_many :rating_changes

  alias_attribute :rating, :current_pbsn_rating

  def slug_candidates
    "#{location}-#{name}"
  end

  def display_name
    location + "  " + name
  end

  def tournament_matches(tournament)
    rt = registered_teams.find_by(tournament: tournament)
    rt.matches
  end
end
