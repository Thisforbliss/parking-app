class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :car_location
      t.string :license_plate
      t.string :car_model
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
