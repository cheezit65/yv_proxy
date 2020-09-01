class AddFacebookToHorses < ActiveRecord::Migration[5.0]
  def change
    add_column :horses, :fb_count, :integer
  end
end
