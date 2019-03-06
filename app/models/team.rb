class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_one_attached :avatar

  def slug_candidates
    "#{location}-#{name}"
  end

  def display_name
    location + "  " + name
  end
end
