class Room < ApplicationRecord
  # Relationships
  belongs_to :hotel
  has_many :reservations
end
