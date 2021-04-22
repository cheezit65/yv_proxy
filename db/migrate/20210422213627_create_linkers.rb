class CreateLinkers < ActiveRecord::Migration[6.1]
  def change
    create_table :linkers do |t|

      t.timestamps
    end
  end
end
