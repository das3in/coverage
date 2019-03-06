class HomeController < ApplicationController
  def index
    @posts = Post.includes(:thumbnail_attachment).order(created_at: :desc).limit(2)
  end
end
