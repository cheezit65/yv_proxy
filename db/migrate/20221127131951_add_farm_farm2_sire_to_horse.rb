class AddFarmFarm2SireToHorse < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :farm, :string
    add_column :horses, :farm2, :string
    add_column :horses, :sire, :string    
  end
end
