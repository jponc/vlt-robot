class SessionsController < ApplicationController
  def new
  end

  def create
    # This is insecure, but for the sake of the app, let's use username as login
    user = User.where(session_params).first
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:user_name)
  end
end
