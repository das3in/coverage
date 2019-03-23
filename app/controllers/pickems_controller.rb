class PickemsController < ApplicationController
  def index; end

  def show
    @pickem = Pickem.find(params[:id])
  end
end
