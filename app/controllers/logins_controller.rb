class LoginsController < ApplicationController
  include LoginsHelper
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:notice] = "You've successfully logged in."
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, :notice => "You have logged out!"
  end
end
