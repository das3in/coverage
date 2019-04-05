class PickemGuess < ApplicationRecord
  belongs_to :pickem
  belongs_to :match
  belongs_to :pickem_player
  belongs_to :guess, class_name: "RegisteredTeam", optional: true
end
