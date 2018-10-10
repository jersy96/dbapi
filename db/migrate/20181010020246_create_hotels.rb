class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :fax
      t.string :phone
      t.string :email
      t.string :website
      t.string :size
      t.string :hotel_type
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
