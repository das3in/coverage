class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :tournament, optional: true

  scope :for_display, -> { order(:created_at).last(50) }
end
