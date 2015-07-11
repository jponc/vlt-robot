class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/game'
    end
  end
end
