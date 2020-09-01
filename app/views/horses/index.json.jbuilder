json.array!(@horses) do |horse|
  json.extract! horse, :id, :Name, :HipNumber, :Gender, :Gait, :Description, :Sale, :PageViews, :BulkUploadVideoName
  json.url horse_url(horse, format: :json)
end
