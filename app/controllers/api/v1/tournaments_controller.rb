module Api
  module V1
    class TournamentsController < BaseController
      skip_before_action :verify_authenticity_token

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

      def create_field
        @tournament = Tournament.find(params[:id])
        @field ||= @tournament.field || @tournament.create_field

        params[:bunkers].each do |bunker|
          @field.bunkers.create(
            name: bunker[:name],
            top: bunker[:top],
            left: bunker[:left],
            rotation: bunker[:rotation],
          )
        end
      end

      private

      def params
        request.params
      end
    end
  end
end
