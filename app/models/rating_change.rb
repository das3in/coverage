class RatingChange < ApplicationRecord
  belongs_to :team
  belongs_to :match, optional: true
  belongs_to :tournament, optional: true
end
