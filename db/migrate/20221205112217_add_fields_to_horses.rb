class AddFieldsToHorses < ActiveRecord::Migration[6.1]
  def change
    t.string :farm
    t.string :farm2
    t.string :BulkUploadVideoName
    t.integer :fb_count
    t.integer :tw_count
    t.integer :e_count
    t.integer :g_count
    t.string :video

  end
end
