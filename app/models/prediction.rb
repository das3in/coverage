class Prediction < ApplicationRecord
  belongs_to :match
  belongs_to :winner_guess, class_name: "Team", optional: true
end
