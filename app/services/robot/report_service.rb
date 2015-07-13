class Robot::ReportService

  def initialize(robot)
    @robot = robot
  end

  def report
    if last_position.present?
      "Hi sir, I'm currently at (#{last_position.x_pos}, #{last_position.y_pos}) facing #{last_position.facing}."
    else
      "No robot in the battlefield."
    end
  end

  def last_position
    @last_position ||= @robot.positions.last
  end
end
