class AddFieldsToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :Name, :string
    add_column :horses, :HipNumber, :string
    add_column :horses, :Gender, :string
    add_column :horses, :Gait, :string
    add_column :horses, :description, :string
    add_column :horses, :Sale, :string
    add_column :horses, :PageViews, :integer
  end
end
