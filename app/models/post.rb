class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :tournament, optional: true

  scope :published, -> { where(draft: false) }

  validates_presence_of :title, :slug, :body

  has_one_attached :thumbnail
end
