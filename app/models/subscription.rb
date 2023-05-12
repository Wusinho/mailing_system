class Subscription < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :preferences, presence: true

  PREFERENCES = %w[men women children]

  validates :preferences, inclusion: { in: PREFERENCES, allow_blank: true }
end
