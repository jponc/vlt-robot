class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :user_id
      t.string :name
      t.timestamps null: false
    end
  end
end
