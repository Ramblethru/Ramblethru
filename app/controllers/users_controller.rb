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
      UserMailer.user_created(@user).deliver
      flash[:notice] = 'Congratulations, you are now registered!'
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = 'There was a problem creating your account.'
      render :new
    end
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        respond_to do |format|
          format.html { redirect_to @user}
          format.json { render json: @user }
        end
      else
        render :edit
      end
  end

  def create_avatar
    @images = Image.all
    @image = Image.new(image_params)
  
    if params[:image]
      if @image.save
        redirect_to :back, notice: 'Photo uploaded.'
      else
        @image.errors.delete(:avatar)
        render :new
      end
    else
      redirect_to :back, alert: 'Photo cannot be blank.'
    end
  end


  protected

  def auth_hash
      request.env['omniauth.auth']
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :bio, :lives_in, :password, :password_confirmation)
  end

  def image_params
    params.require(:image).permit(:avatar) if params[:image]
  end
end

