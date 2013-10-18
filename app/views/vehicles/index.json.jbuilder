json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :year, :make, :model, :color, :transmission, :license_plate_number, :vin, :purchased_date, :purchased_milage, :purchased_from, :purchased_detail
  json.url vehicle_url(vehicle, format: :json)
end