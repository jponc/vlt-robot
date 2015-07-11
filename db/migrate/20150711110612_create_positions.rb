class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :robot_id
      t.string :x_pos
      t.string :y_pos
      t.string :facing
      t.string :move_type
      t.timestamps null: false
    end
  end
end
