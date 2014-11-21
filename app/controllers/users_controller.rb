class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User Created'
      redirect_to new_login_path
    else
      flash[:error] = 'There was a problem creating your account.'
      render :new
    end
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :photo, :bio, :lives_in, :username, :password, :password_confirmation)
  end

  def index
  end
end
