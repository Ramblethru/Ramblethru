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
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def create_auth
    @user = User.find_or_create_by_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to root_url
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def edit
  end

  protected

  def auth_hash
      request.env['omniauth.auth']
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :bio, :lives_in, :password, :password_confirmation)
  end
end
