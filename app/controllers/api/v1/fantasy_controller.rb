module Api
  module V1
    class FantasyController < BaseController
      before_action :authenticate!

      def index; end
      def show; end
    end
  end
end
