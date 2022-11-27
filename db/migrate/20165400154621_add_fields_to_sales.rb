class AddFieldsToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :Location, :string
    add_column :sales, :website, :string
    add_column :sales, :StartDate, :string
    add_column :sales, :SaleCode, :string
    add_column :sales, :EndDate, :string
  end
end
