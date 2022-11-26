class AddFarmToHorse < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :farm, :string
  end
end
