class AddDetailsToSire < ActiveRecord::Migration
  def change
    add_column :sires, :gait, :string
    add_column :sires, :eligibility, :string
  end
end
