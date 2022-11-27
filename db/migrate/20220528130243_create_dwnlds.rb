class CreateVectors < ActiveRecord::Migration[6.1]
  def change
    create_table :vectors do |t|

      t.timestamps
    end
  end
end
