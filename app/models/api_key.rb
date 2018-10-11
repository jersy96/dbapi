class ApiKey < ApplicationRecord
  # Relationships
  belongs_to :user

  # Callbacks
  has_secure_token :key
end
