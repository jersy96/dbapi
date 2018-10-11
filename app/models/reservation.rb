class Reservation < ApplicationRecord
  # Relationships
  belongs_to :room
  belongs_to :user
  belongs_to :hotel

  # Callbacks
  before_validation :set_room_id

  # Validations
  validates :start_date, :final_date, presence: true
  validate :start_date_before_final_date
  validate :available_room_in_hotel

  # Methods
  private
  def start_date_before_final_date
    errors.add(:dates, 'final date must be after the start date') if self.final_date < self.start_date
  end

  def set_room_id
    h = self.hotel
    self.room_id = h.available_room(self.start_date, self.final_date) if h
  end

  def available_room_in_hotel
    errors.add(:hotel, "the hotel with id #{self.hotel_id} has no available rooms for the given date range") unless self.room_id
  end
end
