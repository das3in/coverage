class Post < ApplicationRecord
  delegate :url_helpers, to: 'Rails.application.routes' 

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :tournament, optional: true
  belongs_to :user

  scope :published, -> { where(draft: false) }

  validates_presence_of :title, :slug, :body

  has_one_attached :thumbnail

  def url
    "/api/v1" + url_helpers.news_path(self)
  end
end
