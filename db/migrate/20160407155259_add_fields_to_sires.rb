class AddFieldsToSires < ActiveRecord::Migration[6.0]
  def change
    add_column :sires, :Name, :string
  end
end
