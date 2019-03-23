class Pickem < ApplicationRecord
  belongs_to :tournament
  has_many :pickem_players
  has_many :users, through: :pickem_players
end
