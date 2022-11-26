class AddVideoToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :video, :string
  end
end
