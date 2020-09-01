class CreateBounces < ActiveRecord::Migration[5.0]
  def change
    create_table :bounces do |t|

      t.timestamps
    end
  end
end
