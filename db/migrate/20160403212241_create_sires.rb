class CreateSires < ActiveRecord::Migration[6.0]
  def change
    create_table :sires do |t|
    t.string :Name
    t.string :gait
    t.string :eligibility
      t.timestamps null: false
    end
  end
end
