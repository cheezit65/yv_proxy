class AddConsignorToHorse < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :consignor, :string
  end
end
