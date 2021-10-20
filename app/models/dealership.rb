class Dealership < ApplicationRecord
  has_many :cars, dependent: :restrict_with_error

  validates :name, presence: true
end
