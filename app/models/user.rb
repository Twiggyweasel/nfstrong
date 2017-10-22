# User Model
class User < ApplicationRecord
  has_many :notifications
  has_many :runners
  has_many :registrations
  has_many :fundraisers
  has_many :donations, as: :backable
  paginates_per 10
  scope :new_account, -> { where(created_at: (Time.now - 24.hours)..Time.now) }
end
