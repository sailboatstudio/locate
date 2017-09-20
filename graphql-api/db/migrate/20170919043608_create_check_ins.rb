class CreateCheckIns < ActiveRecord::Migration[5.1]
  def change
    create_table :check_ins do |t|
      t.string :location_name
      t.string :street_address_one
      t.string :street_address_two
      t.string :street_address_three
      t.string :city
      t.string :province
      t.string :country
      t.float :latitude
      t.float :longitude
      t.boolean :is_active

      t.timestamps
    end
  end
end
