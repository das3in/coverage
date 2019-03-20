module Api
  class BaseController < ApplicationController
    respond_to :json
    skip_before_action :verify_authenticity_token

    protected

    def current_user
      super || user_from_authentication_token
    end

    private

    def user_from_authentication_token
      User.find_by(authentication_token: params[:authentication_token])
    end

    def authenticate!
      if !current_user
        render json: {}, status: 403
      end
    end

    def time_zone_from_header
      if request.headers.include?("HTTP_X_TIME_ZONE")
        ActiveSupport::TimeZone[request.headers["HTTP_X_TIME_ZONE"]]
      end
    end
  end
end
