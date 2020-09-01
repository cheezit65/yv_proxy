json.array!(@searches) do |search|
  json.extract! search, :id, :advanced
  json.url search_url(search, format: :json)
end
