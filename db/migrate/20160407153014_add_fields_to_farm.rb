class AddFieldsToFarm < ActiveRecord::Migration
  def change
    add_column :farms, :name, :string
    add_column :farms, :address, :string
    add_column :farms, :city, :string
    add_column :farms, :state, :string
    add_column :farms, :zipcode, :string
    add_column :farms, :phonenumber, :string
    add_column :farms, :website, :string
    add_column :farms, :email, :string
    add_column :farms, :FarmCode, :string
  end
end
