class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|

      t.timestamps null: false
    end
  end
end
