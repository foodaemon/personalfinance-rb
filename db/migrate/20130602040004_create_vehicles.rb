class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.date :year
      t.string :make
      t.string :model
      t.string :color
      t.string :transmission
      t.string :license_plate_number
      t.string :vin
      t.string :purchase_date
      t.integer :purchase_mileage
      t.string :purchased_from
      t.text :purchase_detail

      t.timestamps
    end
  end
end
