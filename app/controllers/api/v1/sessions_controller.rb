module Api
  module V1
    class SessionsController < BaseController
      def create
        @user = User.find_by_email(user_params[:email])

        if @user.valid_password?(user_params[:password])
          @user.regenerate_authentication_token

          respond_to do |format|
            format.json
          end
        else
          respond_to do |format|
            format.json { render json: {}, status: 403 }
          end
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
