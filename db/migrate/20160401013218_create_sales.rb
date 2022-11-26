class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|

      t.timestamps null: false
    end
  end
end
