class AddFieldsToSires < ActiveRecord::Migration[6.0]
  def change
    add_column :sires, :Name, :string
    add_column :sires, :gait, :string
    add_column :sires, :eligibility, :string
  end
end