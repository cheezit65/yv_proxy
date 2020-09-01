class AddEmailToHorses < ActiveRecord::Migration[5.0]
  def change
    add_column :horses, :e_count, :integer
  end
end
