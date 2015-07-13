class Api::RobotsController < Api::ApplicationController
  before_filter :init_robot, only: [:change_position, :action, :report]

  def change_position
    position = @robot.positions.build(position_params)
    if position.save
      @resp[:success] = true
      @resp[:new_position] = position
    else
      @resp[:errors] << 'Robot position not changed.'
    end
    render json: @resp
  end

  def action
    resp = Robot::MovementService.new(@robot).movement(params[:movement])
    render json: resp
  end

  def report
    msg = Robot::ReportService.new(@robot).report
    render json: {msg: msg}
  end

  private

  def init_robot
    @robot = current_user.robots.find params[:id]
  end

  def position_params
    params.require(:position).permit(:x_pos, :y_pos, :facing, :move_type)
  end
end
