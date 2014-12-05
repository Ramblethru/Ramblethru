class LoginsController < ApplicationController
  include LoginsHelper
  before_filter :check_user_signed_in, :only => [:create]


  def check_user_signed_in
    logged_in?
  end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to :back, :notice => "You have logged in!"

    else
      redirect_to root_url, :notice => "Your username or password was incorrect."
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, :notice => "You have logged out!"
  end
end
