class AddTwitterToHorses < ActiveRecord::Migration[5.0]
  def change
    add_column :horses, :tw_count, :integer
  end
end
