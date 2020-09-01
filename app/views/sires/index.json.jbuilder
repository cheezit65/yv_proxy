json.array!(@sires) do |sire|
  json.extract! sire, :id
  json.url sire_url(sire, format: :json)
end
