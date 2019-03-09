class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @tournament = Tournament.find(params[:tournament_id])
  end

  def edit
    @match = Match.find(params[:id])
    @tournament = Tournament.find(params[:tournament_id])
  end

  def new
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.matches.new
  end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @tournament.matches.new(match_params)

    if @tournament.save
      redirect_to tournament_matches_path(@tournament)
    else
      render "new"
    end
  end

  def update
    @match = Match.find(params[:id])

    if @match.update(match_params)
      redirect_to edit_tournament_match_path(@match.tournament, @match)
    else
      render :edit
    end
  end

  def generate_prediction
    @match = Match.find(params[:id])
    PredictionGenerator.new(@match).run

    redirect_to edit_tournament_match_path(@match.tournament, @match)
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
      :completed,
      :current,
      :day,
    )
  end
end
