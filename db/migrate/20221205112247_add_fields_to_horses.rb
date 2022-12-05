class AddFieldsToHorses < ActiveRecord::Migration[6.1]
  def change
    add_column :farm, :string 
    add_column :farm2, :string
    add_column :BulkUploadVideoName,:string
    add_column :fb_count,:integer
    add_column :tw_count,:integer
    add_column :e_count,:integer
    add_column :g_count,:integer
    add_column :video,:string

  end
end
