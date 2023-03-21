class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            render json: @user, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

end
