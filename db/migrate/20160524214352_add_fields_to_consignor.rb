class AddFieldsToConsignor < ActiveRecord::Migration
  def change
    add_column :consignors, :name, :string
    add_column :consignors, :address, :string
    add_column :consignors, :city, :string
    add_column :consignors, :state, :string
    add_column :consignors, :zipcode, :string
    add_column :consignors, :phonenumber, :string
    add_column :consignors, :website, :string
    add_column :consignors, :email, :string
  end
end
