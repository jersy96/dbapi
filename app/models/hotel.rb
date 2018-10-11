class Hotel < ApplicationRecord
  # Relationships
  has_many :rooms

  # Validations
  validates :name, :address, :hotel_type, :size, presence: true
  validates :email, format: {with: /\A(^\S+)[@](\w+)(\.[a-zA-Z0-9]+)+\z/, :message => 'invalid format'}, allow_blank: true

  # Methods
  def available_room(start_date, final_date)
    reservations = Reservation.where(
      '(start_date <= ? AND final_date > ?) OR (start_date <= ? AND final_date > ?) OR (? <= start_date AND ? > start_date)',
      start_date, start_date, final_date, final_date, start_date, final_date
    ).where(hotel_id: self.id)
    busy_rooms = reservations.pluck(:room_id)
    self.rooms.each do |room|
      return room.id unless busy_rooms.include? room.id
    end
    return nil
  end
end
