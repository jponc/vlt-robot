class RobotPresenter
  attr_reader :data
  delegate :as_json, :to => :data

  ATTRS = [
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
  end
end
