class CreateBulkAdds < ActiveRecord::Migration[6.1]
  def change
    create_table :bulk_adds do |t|

      t.timestamps
    end
  end
end
