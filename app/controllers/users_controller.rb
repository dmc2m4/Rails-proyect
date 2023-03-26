class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy, :edit]

    skip_before_action :authenticate_request, only: [:index, :new, :create]

    def index
        @users = User.all
        # render json: @users, status: :ok
    end

    def show
        render json: @user, status: :ok
    end

    def new
        @user = User.new
      end

    def create
        @user = User.new(user_params)
        puts @user
        if @user.save 
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
        head :no_content
    end

    def edit
        if @user.update(user_params)
            redirect_to @user
          else
            render :edit, status: :unprocessable_entity
          end
    end


    def set_user
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :img, :password, :name)
    end

end
