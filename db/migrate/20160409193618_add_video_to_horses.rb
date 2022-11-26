class AddVideoToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :video, :string
  end
end
