class RegisteredTeamsController < ApplicationController
  before_action :set_tournament

  def index
    @teams = @tournament.registered_teams.includes(:team)
  end

  def edit
    @team = @tournament.registered_teams.find(params[:id])
  end

  def update
    @team = @tournament.registered_teams.find(params[:id])

    if @team.update(team_params)
      redirect_to tournament_registered_teams_path(@tournament)
    else
      render :edit
    end
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def team_params
    params.require(:registered_team).permit(:group, :wins, :losses)
  end
end
