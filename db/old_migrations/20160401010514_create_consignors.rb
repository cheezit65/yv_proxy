class CreateConsignors < ActiveRecord::Migration[6.0]
  def change
    create_table :consignors do |t|

      t.timestamps null: false
    end
  end
end
