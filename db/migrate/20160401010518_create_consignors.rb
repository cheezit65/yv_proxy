class CreateConsignors < ActiveRecord::Migration
  def change
    create_table :consignors do |t|

      t.timestamps null: false
    end
  end
end
