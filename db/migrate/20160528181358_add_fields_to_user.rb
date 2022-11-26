class AddFieldsToUser < ActiveRecord::Migration
  def change
     add_column :users, :farm, :integer
     add_column :users, :business, :string
  end
end
