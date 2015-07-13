class RobotPresenter
  attr_reader :data
  delegate :as_json, :to => :data

  ATTRS = [
    :id,
    :user_id,
    :name,
    :created_at
  ]

  def initialize(data)
    get_data(data)
  end

  private

  def get_data(data)
    @data = {}
    ATTRS.each do |attribute|
      @data[attribute] = data.send(attribute)
    end
    @data[:current_position] = data.positions.last
  end
end
