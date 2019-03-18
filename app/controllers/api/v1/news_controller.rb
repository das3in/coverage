module Api
  module V1
    class NewsController < ApplicationController
      def show
        @post = Post.friendly.find(params[:id])

        render layout: 'webview'
      end
    end
  end
end
