class AuthenticationController < ApplicationController

    skip_before_action :authenticate_request, only: [:login]
    
    def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            redirect_to edit_user_path
        else
            redirect_to new_user_path
            # render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end

end
