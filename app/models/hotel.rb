class Hotel < ApplicationRecord
  # Validations
  validates :name, :address, :hotel_type, :size, presence: true
end
