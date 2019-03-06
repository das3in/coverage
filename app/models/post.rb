class Post < ApplicationRecord
  scope :published, -> { where(draft: false) }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :slug, :body
  has_one_attached :thumbnail
end
