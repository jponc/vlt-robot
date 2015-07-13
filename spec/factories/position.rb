FactoryGirl.define do
  factory :position do
    x_pos '1'
    y_pos '1'
    facing 'north'
    move_type 'place'
    robot
  end
end
