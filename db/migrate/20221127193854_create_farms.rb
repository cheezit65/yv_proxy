class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
    t.string :name
    t.string :address
    t.string :city
    t.string :state
    t.string :zipcode
    t.string :phonenumber
    t.string :website
    t.string :email
    t.string :FarmCode
      t.timestamps
    end
  end
end
