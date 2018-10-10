class User < ApplicationRecord
  # Relationships
  has_many :reservations

  # Validations
  validates :name , :lastname, :email, :password, presence: true
end
