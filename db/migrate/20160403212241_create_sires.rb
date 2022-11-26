class CreateSires < ActiveRecord::Migration
  def change
    create_table :sires do |t|

      t.timestamps null: false
    end
  end
end
