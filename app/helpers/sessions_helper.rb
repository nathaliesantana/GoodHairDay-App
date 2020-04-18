module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    current_user
  end

  def admin?
    @admin = User.find_by(:id => 1, :username =>"admin")
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/login'
    end
  end

  # def redirect_if_not_logged_in
  #   redirect_to '/' if !logged_in?
  # end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
