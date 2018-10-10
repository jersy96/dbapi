class Reservation < ApplicationRecord
  # Relationships
  belongs_to :room
  belongs_to :user

  # Validations
  validates :start_date, :final_date, presence: true
end
