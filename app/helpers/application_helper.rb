module ApplicationHelper
  def logged_in?
    !session[:current_user_id].nil?
  end
end
