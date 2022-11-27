class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|

      t.timestamps null: false
    end
  end
end
