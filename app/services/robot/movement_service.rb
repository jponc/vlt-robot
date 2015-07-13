class Robot::MovementService

  FACING = %w{north east south west}

  def initialize(robot)
    @robot = robot
  end

  def movement(action)
    if last_position.present?
      case action
      when 'move'
        move
      when 'left'
        left
      when 'right'
        right
      end
    else
      {success: false, errors: ['Cannot move. No robot in the battlefield!']}
    end
  end

  def move
    resp = {success: false, errors: []}
    x = last_position.x_pos.to_i
    y = last_position.y_pos.to_i
    facing = last_position.facing
    case facing
    when 'north'
      x += 1
    when 'east'
      y += 1
    when 'south'
      x -= 1
    when 'west'
      y -= 1
    end

    if (0..4).include?(x) && (0..4).include?(y)
      new_position = last_position.dup
      new_position.x_pos = x
      new_position.y_pos = y
      new_position.save
      resp[:new_position] = new_position
      resp[:success] = true
    else
      resp[:errors] << "Sir I'm going to fall. Please take care."
    end

    resp
  end

  def left
    change_position_facing(current_index - 1)
  end

  def right
    new_index = current_index == 3 ? 0 : current_index + 1
    change_position_facing(new_index)
  end

  def change_position_facing(new_facing_index)
    new_position = last_position.dup
    new_position.facing = FACING[new_facing_index]
    new_position.save

    {success: true, new_position: new_position}
  end

  def current_index
    FACING.index(last_position.facing)
  end

  def last_position
    @last_position ||= @robot.positions.last
  end
end
