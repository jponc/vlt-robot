class Position < ActiveRecord::Base
  belongs_to :robot

  # enum move_type: [
  #   :move,
  #   :place,
  #   :left,
  #   :right
  # ]
  #
  # enum facing: [
  #   :north, :east, :south, :west
  # ]
end
