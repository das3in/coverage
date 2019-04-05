class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]

  def index
    @teams = Team.includes(:avatar_attachment).all
  end

  def show
    @team = Team.friendly.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.friendly.find(params[:id])

    if @team.update(team_params)
      redirect_to teams_path
    else
      render :edit
    end
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
    params.require(:team).permit(:location, :name, :avatar)
  end
end
