class Subscription < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :preferences, presence: true

  PREFERENCES = %w[men women children]

  validates :preferences, inclusion: { in: PREFERENCES, allow_blank: true }
end
