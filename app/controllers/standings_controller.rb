class StandingsController < ApplicationController
  def index
    @teams = Team.order(current_pbsn_rating: :desc)
  end
end
