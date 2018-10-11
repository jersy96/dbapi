class AddNumberOfRoomsToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :number_of_rooms, :integer
    remove_column :hotels, :size
    add_column :hotels, :size, :string
  end
end
