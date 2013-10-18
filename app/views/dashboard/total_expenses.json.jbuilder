json.array!(@trans) do |transaction|
  json.extract! transaction, :date, :amount
end