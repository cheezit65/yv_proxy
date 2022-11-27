class CreateSires < ActiveRecord::Migration[6.0]
  def change
    create_table :sires do |t|

      t.timestamps null: false
    end
  end
end
