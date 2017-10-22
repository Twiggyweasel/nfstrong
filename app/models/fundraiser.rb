# Fundraiser Model
class Fundraiser < ApplicationRecord
  # Relationships
  belongs_to :event
  has_many :donations, as: :backable

  # validations
  validates :shirt_size, presence: true
  validates :to_raise, presence: true
  validates :accepted_terms, acceptance: true

  # Methods
end
