class MatchesController < ApplicationController
  def new
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.matches.new
  end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @tournament.matches.new(match_params)

    if @tournament.save
      redirect_to @tournament
    else
      render "new"
    end
  end

  private

  def match_params
    params.require(:match).permit(
      :home_team_id,
      :away_team_id,
      :home_team_score,
      :away_team_score,
      :round,
      :winner_id,
    )
  end
end
