class AddBulkUploadVideoNameToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :bulk_upload_video_name, :string
  end
end
