class CreateMaintenanceHistories < ActiveRecord::Migration
  def change
    create_table :maintenance_histories do |t|
      t.integer :vehicle_id
      t.integer :mileage
      t.string :item
      t.string :item_description
      t.date :maintenance_date
      t.string :repair_shop
      t.string :repair_shop_location
      t.string :repair_shop_phone
      t.float :maintenance_cost

      t.timestamps
    end
  end
end
