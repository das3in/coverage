class PickemGuess < ApplicationRecord
  belongs_to :pickem
  belongs_to :match
  belongs_to :guess
end
