class Tournament < ApplicationRecord
  belongs_to :league
  has_many :registered_teams
  has_many :teams, through: :registered_teams
  has_many :matches
  has_one_attached :thumbnail
end
