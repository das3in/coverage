class StandingsController < ApplicationController
  def index
    @teams = Team.all
  end
end
