class Subscription < ApplicationRecord
  validates :email, presence: true
  validates :preferences, presence: true

  PREFERENCES = %w[men women children]

  # serialize :preferences, Array
  validates :preferences, inclusion: { in: PREFERENCES, allow_blank: true }
end
