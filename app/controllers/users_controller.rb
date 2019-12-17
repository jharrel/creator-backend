class UsersController < ApplicationController
before_action :set_user, only: [:show, :update, :destroy]
    def index
        @users = User.all 
        render json: @users, include: [:worlds], status: 201
    end

    def show
        render json: @user, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: 200
        else
            render json: { errors: @user.errors.full_messages }
        end
    end

    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: { errors: @user.errors.full_messages }
        end
    end

    def destroy
        @user.destroy
        render json: { notice: "The user has been deleted by Order 66" }
    end

    private
        def set_user
            @user = User.find_by_id(params[:id])
        end

        def user_params
            params.require(:user).permit(:name, :ship)
        end
end
