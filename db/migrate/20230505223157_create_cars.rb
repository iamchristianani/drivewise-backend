class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.string :body_type
      t.float :engine_capacity
      t.integer :engine_cylinders
      t.boolean :turbo
      t.integer :horsepower
      t.integer :torque
      t.integer :weight
      t.string :drivetrain
      t.string :transmission
      t.string :fuel_type
      t.integer :doors
      t.integer :seats
      t.integer :mileage
      t.integer :price
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
