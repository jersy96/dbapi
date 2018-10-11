class User < ApplicationRecord
  # Relationships
  has_many :reservations
  has_many :api_keys

  # Validations
  validates :name , :lastname, :email, :password, presence: true
  validates :email, :uniqueness => {:message => 'already used'}, allow_blank: true
  validates :email, format: {with: /\A(^\S+)[@](\w+)(\.[a-zA-Z0-9]+)+\z/, :message => 'invalid format'}, allow_blank: true
end
