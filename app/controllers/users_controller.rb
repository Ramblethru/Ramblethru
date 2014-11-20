class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
    end

    def update
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
        @user.destroy
        redirect_to users_url, notice: 'User was successfully destroyed.'
        end
    end

    def edit
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :photo, :bio, :lives_in, :username, :password_digest)
    end
end
