# Runner Model
class Runner < ApplicationRecord
  belongs_to :user
  has_many :donations, as: :backable
end
