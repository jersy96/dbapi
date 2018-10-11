class Reservation < ApplicationRecord
  # Relationships
  belongs_to :room
  belongs_to :user

  # Validations
  validates :start_date, :final_date, presence: true
  validate :start_date_before_final_date

  # Methods
  private
  def start_date_before_final_date
    errors.add(:dates, 'final date must be after the start date') if self.final_date < self.start_date
  end
end
