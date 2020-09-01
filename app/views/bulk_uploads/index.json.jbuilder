json.array!(@bulk_uploads) do |bulk_upload|
  json.extract! bulk_upload, :id, :Name, :HipNumber, :Gender, :Gait, :Description, :Sale, :BulkUploadVideoName, :farm, :sire
  json.url bulk_upload_url(bulk_upload, format: :json)
end
