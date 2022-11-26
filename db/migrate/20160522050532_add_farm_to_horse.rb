class AddFarmToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :farm, :string
  end
end
