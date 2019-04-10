module Api
  module V1
    class MatchesController < BaseController
      skip_before_action :verify_authenticity_token

      def create_point
        match = Match.find(params[:id])
        point = match.points.create(winner_id: params[:winner])

        params[:events].each do |event|
          puts event
          point.point_events.create(
            bunkerId: event[:bunkerId],
            status: event[:status],
            eventType: event[:eventType],
            playerId: event[:playerId],
          )
        end
      end
    end
  end
end
