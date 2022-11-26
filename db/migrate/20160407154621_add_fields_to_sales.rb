class AddFieldsToSales < ActiveRecord::Migration
  def change
    add_column :sales, :Name, :string
    add_column :sales, :Location, :string
    add_column :sales, :website, :string
  end
end
