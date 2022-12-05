class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|
      t.string :Name
      t.string :HipNumber
      t.string :Gender
      t.string :Gait
      t.string :Description
      t.string :Sale
      t.integer :PageViews
      t.string :sire
      t.string :farm
      t.string :farm2
      t.string :BulkUploadVideoName
      t.integer :fb_count
      t.integer :tw_count
      t.integer :e_count
      t.integer :g_count
      t.string :video
     t.timestamps null: false
    end
  end
end
