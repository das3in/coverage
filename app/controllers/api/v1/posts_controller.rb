module Api
  module V1
    class PostsController < BaseController
      def index
        @posts = Post.where(draft: false).includes(:tournament).order(created_at: :desc)

        respond_to do |format|
          format.json
          format.html { redirect_to news_index_path }
        end
      end
    end
  end
end
