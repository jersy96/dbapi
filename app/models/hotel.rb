class Hotel < ApplicationRecord
  # Relationships
  has_many :rooms

  # Validations
  validates :name, :address, :hotel_type, :number_of_rooms, presence: true
  validates :email, format: {with: /\A(^\S+)[@](\w+)(\.[a-zA-Z0-9]+)+\z/, :message => 'invalid format'}, allow_blank: true
  validates :number_of_rooms, :numericality => { :greater_than_or_equal_to => 10 }

  # Callbacks
  before_save :set_size
  before_save :set_coordinates

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

  protected
  def set_size
    if self.number_of_rooms >= 10 and self.number_of_rooms <= 50
      self.size = 'small'
    elsif self.number_of_rooms >= 51 and self.number_of_rooms <= 100
      self.size = 'medium'
    elsif self.number_of_rooms > 100
      self.size = 'large'
    end
  end

  def set_coordinates
    if self.address_changed?
      res = JSON.parse(HTTParty.get("http://dev.virtualearth.net/REST/v1/Locations?q=#{self.address}&key=Akjjm0BrUxXcTlXLiB31YA1W2DPQqgVyFU7d4X5qFY_y9YgC27g7W9YUHsRjfwuE").body)
      if res['statusCode'] == 200 
        coordinates = res['resourceSets'].first['resources'].first['point']['coordinates']
        self.latitude = coordinates[0].to_s
        self.longitude = coordinates[1].to_s
      else
        Rails.logger.info('EL API KEY DE GOOGLE YA NO FUNCIONA') 
      end 
    end 
  end
end
