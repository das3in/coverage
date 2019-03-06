class TournamentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @tournaments = Tournament.order(start_date: :desc).all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
    @leagues = League.all
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to @tournament
    else
      render :new
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :start_date,
      :end_date,
      :league_id,
      :thumbnail,
    )
  end
end
