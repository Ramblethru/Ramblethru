class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:current_user_id] = user.id
  end

  def logged_in?
    !!current_user
  end

   def authenticate
    current_user_id = session[:current_user_id]
    unless current_user_id
      render 'logins/new', notice: "You must be logged in to view users rambles"
    end
  end

end
