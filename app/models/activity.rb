# Activity Model
class Activity < ApplicationRecord
  # Relationships
  belongs_to :event

  # Validations
  validates :name, presence: true, length: { minimum: 5 }

  # Methods
end
