class ApplicationController < ActionController::Base
  # Makes these methods accessible inside your HTML view templates
  helper_method :current_user, :logged_in?

  private

  def current_user
    # Looks up the user if a session exists, caching it in an instance variable
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = "You must be signed in to perform that action."
      redirect_to login_path
    end
  end
end