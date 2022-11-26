class AddConsignorToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :consignor, :string
  end
end
