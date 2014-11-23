class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

<<<<<<< HEAD
    def create
        @user = User.find_or_create_by_auth_hash(auth_hash)
        self.current_user = @user
        redirect_to root_url
    end
=======
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
>>>>>>> 1a0b03b19895976456ec0f239f4d3a09840671c4

  def update
    @user.update(user_params)
    redirect_to @user
  end

<<<<<<< HEAD
=======
  def create_auth
    @user = User.find_or_create_by_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to root_url
  end
>>>>>>> 1a0b03b19895976456ec0f239f4d3a09840671c4

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def edit
  end
<<<<<<< HEAD

    protected
=======

  protected

  def auth_hash
      request.env['omniauth.auth']
  end
>>>>>>> 1a0b03b19895976456ec0f239f4d3a09840671c4

  private

<<<<<<< HEAD
    private

=======
>>>>>>> 1a0b03b19895976456ec0f239f4d3a09840671c4
  def user_params
    params.require(:user).permit(:name, :email, :photo, :bio, :lives_in, :password, :password_confirmation)
  end
<<<<<<< HEAD

=======
>>>>>>> 1a0b03b19895976456ec0f239f4d3a09840671c4

  def index
  end
end
