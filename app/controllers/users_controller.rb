class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
    end
    redirect_to root_url
  end


  private

  def user_params
    params.require(:user).permit(:full_name, :user_name)
  end
end
