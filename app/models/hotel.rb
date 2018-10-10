class Hotel < ApplicationRecord
  # Relationships
  has_many :rooms

  # Validations
  validates :name, :address, :hotel_type, :size, presence: true
end
