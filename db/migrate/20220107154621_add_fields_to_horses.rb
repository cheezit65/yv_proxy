class AddFieldsToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :sire, :string
    add_column :horses, :farm, :string
    add_column :horses, :farm2, :string
    add_column :horses, :fb_count, :string
    add_column :horses, :tw_count, :string
    add_column :horses, :g_count, :string
    add_column :horses, :e_count, :string
    add_column :horses, :Description, :string
  end
end