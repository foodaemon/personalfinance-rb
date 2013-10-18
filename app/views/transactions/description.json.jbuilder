#json.array! @descriptions.map {|d| d.description}.join(',')
json.array!(@descriptions) do |d|
  json.extract! d, :description
end