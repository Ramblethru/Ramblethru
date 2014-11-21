class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

    def create
        @user = User.find_or_create_by_auth_hash(auth_hash)
        self.current_user = @user
        redirect_to root_url
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

    protected

    def auth_hash
        request.env['omniauth.auth']
    end

    private

  def user_params
    params.require(:user).permit(:name, :email, :photo, :bio, :lives_in, :username, :password, :password_confirmation)
  end


  def index
  end
end
