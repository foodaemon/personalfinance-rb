json.array!(@maintenance_histories) do |maintenance_history|
  json.extract! maintenance_history, :vechicle_id, :mileage, :item, :item_description, :maintenance_date, :repair_shop, :repair_shop_location, :repair_shop_phone, :maintenance_cost
  json.url maintenance_history_url(maintenance_history, format: :json)
end