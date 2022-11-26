class AddBulkUploadVideoNameToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :bulk_upload_video_name, :string
  end
end
