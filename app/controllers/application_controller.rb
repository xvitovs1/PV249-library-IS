# Main application controller.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Gets user that is currently logged in.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Checks whether the user is logged in.
  def authorize
    redirect_to '/login' unless current_user
  end

  # Checks whether admin is logged in.
  def authorize_admin
    redirect_to '/librarians/denied' unless current_user && current_user.admin?
  end

  # Checks whether a librarian is logged in.
  def authorize_librarians
    redirect_to '/librarians/denied' unless current_user && current_user.librarian
  end
end
