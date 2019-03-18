module Api
  class BaseController < ApplicationController
    respond_to :json

    protected

    def time_zone_from_header
      if request.headers.include?("HTTP_X_TIME_ZONE")
        ActiveSupport::TimeZone[request.headers["HTTP_X_TIME_ZONE"]]
      end
    end
  end
end
