class AddFieldToSales < ActiveRecord::Migration[6.0]
  def change
        add_column :sales, :StartDate, :date
  end
end
