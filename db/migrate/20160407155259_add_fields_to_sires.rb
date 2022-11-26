class AddFieldsToSires < ActiveRecord::Migration
  def change
    add_column :sires, :Name, :string
  end
end
