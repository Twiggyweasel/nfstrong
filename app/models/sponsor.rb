# Sponsor Model
class Sponsor < ApplicationRecord
  # Relationships
  belongs_to :event
  has_many :donations, as: :backable

  # validations
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validates :fee, presence: true
  validates :category, presence: true
  validates :accepted_terms, acceptance: true

  # Methods
end
