class AddFieldsToHorses < ActiveRecord::Migration[6.1]
  def change
    add_column :horses, :farm, :string 
    add_column :horses,  :farm2, :string
    add_column :horses,  :BulkUploadVideoName,:string
    add_column :horses,  :fb_count,:integer
    add_column :horses,  :tw_count,:integer
    add_column :horses,  :e_count,:integer
    add_column :horses,  :g_count,:integer
    add_column :horses,  :video,:string

  end
end
