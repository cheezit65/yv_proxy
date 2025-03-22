class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
    t.string :Name
    t.string :Location
    t.string :website
    t.date :StartDate
    t.string :SaleCode
    t.date :EndDate
      t.timestamps null: false
    end
  end
end
