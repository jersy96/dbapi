class User < ApplicationRecord
  # Relationships
  has_many :reservations
  has_many :api_keys

  # Validations
  validates :name , :lastname, :email, :password, presence: true
end
