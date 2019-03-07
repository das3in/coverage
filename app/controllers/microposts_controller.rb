class MicropostsController < ApplicationController
  before_action :authenticate_user!

  def create
    micropost = current_user.microposts.build(micropost_params)

    if micropost.save
      ActionCable.server.broadcast "coverage_channel",
        content: micropost.content,
        user: micropost.user.display_name,
        avatar: micropost.user.email,
        time: micropost.created_at.strftime("%I:%M %p")
    end
  end

  def micropost_params
    params.require(:micropost).permit(:content).merge(tournament_id: params[:tournament_id])
  end
end
