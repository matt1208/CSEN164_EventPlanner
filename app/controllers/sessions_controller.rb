class SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id # Persist user session state
      redirect_to root_path, notice: "Welcome back, #{user.name}!"
    else
      flash.now[:alert] = "Invalid login credentials. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil # Wipe session
    redirect_to root_path, notice: "You have been logged out successfully."
  end
end