class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :username
      t.integer :phone_number
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
