class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :advanced

      t.timestamps null: false
    end
  end
end
