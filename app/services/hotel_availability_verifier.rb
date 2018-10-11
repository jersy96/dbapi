class HotelAvailabilityVerifier
  def available?(hotel_id, start_date, final_date)
    reservations = Reservation.where('(start_date >= ? AND final_date < ?) OR (start_date >= ? AND final_date < ?)', start_date, start_date, final_date, final_date)
    busy_rooms = reservations.pluck(:room_id)
    hotel = Hotel.find(hotel_id)
    cont = 0
    hotel.rooms.each do |room|
      cont +=1 if busy_rooms.include? room.id
    end
    cont < hotel.size
  end
end
