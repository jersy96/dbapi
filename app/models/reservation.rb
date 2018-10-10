class Reservation < ApplicationRecord
  # Relationships
  belongs_to :room

  # Validations
  validates :start_date, :final_date, presence: true
end
