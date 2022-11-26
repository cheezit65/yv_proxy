class CreateSearchSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :search_suggestions do |t|
      t.string :term

      t.timestamps null: false
    end
  end
end
