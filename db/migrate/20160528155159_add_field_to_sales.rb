class AddFieldToSales < ActiveRecord::Migration
  def change
        add_column :sales, :StartDate, :date
  end
end
