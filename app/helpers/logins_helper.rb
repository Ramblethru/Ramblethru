module LoginsHelper
<<<<<<< HEAD
  def login(user)
=======
	def login(user)
>>>>>>> dheckman-master
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
