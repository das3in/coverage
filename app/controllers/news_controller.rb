class NewsController < ApplicationController
  def index
    @posts = Post
      .includes(:thumbnail_attachment)
      .published
      .order(created_at: :desc)
  end

  def show
    @post = Post.friendly.find(params[:id])
  end
end
