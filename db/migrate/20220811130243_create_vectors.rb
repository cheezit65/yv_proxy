class CreateDwnlds < ActiveRecord::Migration[6.1]
  def change
    create_table :dwnlds do |t|

      t.timestamps
    end
  end
end
