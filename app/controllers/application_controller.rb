class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    unless session[:current_user_id]
      redirect_to login_users_path
    end
  end

  def require_manager
    unless session[:current_user_role] == "manager"
      redirect_to login_users_path
    end
  end

end
