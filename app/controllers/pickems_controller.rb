class PickemsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show
    @pickem = Pickem.find(params[:id])
    @player = @pickem.pickem_players.find_by(user: current_user)
  end
end
