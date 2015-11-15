json.array!(@sales) do |sale|
  json.extract! sale, :id, :buyer_id, :description, :price, :quantity, :supplier_id
  json.url sale_url(sale, format: :json)
end
