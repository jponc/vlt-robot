class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|

      t.timestamps null: false
    end
  end
end
