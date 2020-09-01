json.array!(@consignors) do |consignor|
  json.extract! consignor, :id
  json.url consignor_url(consignor, format: :json)
end
