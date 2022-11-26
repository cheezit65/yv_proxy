class CreateBulkUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :bulk_uploads do |t|
      t.string :Name
      t.string :HipNumber
      t.string :Gender
      t.string :Gait
      t.string :Description
      t.string :Sale
      t.string :BulkUploadVideoName
      t.string :farm
      t.string :sire

      t.timestamps null: false
    end
  end
end
