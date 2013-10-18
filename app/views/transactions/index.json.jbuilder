json.array!(@transactions) do |transaction|
  json.extract! transaction, :date, :description, :category_id, :amount, :is_income, :comments
  json.url transaction_url(transaction, format: :json)
end