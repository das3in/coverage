class StandingsController < ApplicationController
  def index
    if params[:division]
      @teams = Team
        .where(division: params[:division])
        .order(current_pbsn_rating: :desc)
    else
      @teams = Team.where(division: "pro").order(current_pbsn_rating: :desc)
    end

    respond_to do |format|
      format.js
      format.html
    end
  end
end
