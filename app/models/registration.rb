# Registration Model
class Registration < ApplicationRecord
  # Relationships
  belongs_to :event
  belongs_to :user
  has_many :donations, as: :backable
  has_many :notifications, as: :notifiable
  # Validations
  validates :fee, presence: true
  # validates :shirt_size, presence: true
  validates :accepted_terms, acceptance: true

  # Methods

  paginates_per 10
end
