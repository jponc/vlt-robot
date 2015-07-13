class GameController < ApplicationController
  def index
    @robot = current_user.robots.last

    if @robot.nil?
      @robot = current_user.robots.create
    end

    @robot = RobotPresenter.new(@robot)
  end
end
