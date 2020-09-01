class AddGoogleToHorses < ActiveRecord::Migration[5.0]
  def change
    add_column :horses, :g_count, :integer
  end
end
