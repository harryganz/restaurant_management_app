module ApplicationHelper
  def logged_in?
    !session[:current_user_id].nil?
  end

  def is_manager?
    session[:current_user_role] == "manager"
  end
end
