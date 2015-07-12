class Api::RobotsController < Api::ApplicationController
  before_filter :init_robot, only: [:new_position]
  def index
    robots = current_user.robots.map { |r| RobotPresenter.new(r) }
    render json: robots
  end

  def create
    robot = current_user.robots.build(robot_params)
    if robot.save
      @resp[:success] = true
    else
      @resp[:errors] << 'Unable to create your robot.'
    end
  end

  def new_position
    @robot.positions.build(position_params)
  end

  private

  def init_robot
    @robot = current_user.robots.find params[:id]
  end

  def robot_params
  end

  def position_params
  end
end
