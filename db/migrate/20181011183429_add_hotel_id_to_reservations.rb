class AddHotelIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :hotel_id, :integer
  end
end
