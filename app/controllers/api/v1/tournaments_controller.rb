module Api
  module V1
    class TournamentsController < BaseController
      def index
        @tournaments = Tournament.order(created_at: :desc)

        respond_to do |format|
          format.json
          format.html { redirect_to tournaments_path }
        end
      end

      def show
        @tournament = Tournament.find(params[:id])
        
        respond_to do |format|
          format.json
          format.html { redirect_to @tournament }
        end
      end
    end
  end
end
