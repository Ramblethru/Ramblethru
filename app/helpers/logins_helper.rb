module LoginsHelper
  def login(user)
    session[:current_user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:current_user_id)
    @current_user = nil
  end
end
