class AddFarmcodeToFarms < ActiveRecord::Migration[6.1]
  def change
    add_column :farms, :FarmCode, :string
  end
end
