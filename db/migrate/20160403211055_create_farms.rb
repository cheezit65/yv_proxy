class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|

      t.timestamps null: false
    end
  end
end
