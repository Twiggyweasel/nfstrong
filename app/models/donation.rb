# Donation Model
class Donation < ApplicationRecord
  # Relationships
  belongs_to :backable, polymorphic: true
  belongs_to :user
  # Validations
  # Methods
end
