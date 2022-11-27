class AddFieldsToFarm < ActiveRecord::Migration
  def change
    add_column :farms, :FarmCode, :string
  end
end
