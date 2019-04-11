class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :delete]

  def index
    if params[:division]
      @teams = Team
        .includes(:avatar_attachment)
        .where(division: params[:division])
        .order(current_pbsn_rating: :desc)
    else
      @teams = Team.includes(:avatar_attachment).where(division: "pro").order(current_pbsn_rating: :desc)
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @team = Team.friendly.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:location, :name, :avatar, :division)
  end
end
