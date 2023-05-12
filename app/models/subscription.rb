class Subscription < ApplicationRecord
  include Validatetable
  has_one :survey
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :preferences, presence: true
  validate :email_api_validation

  PREFERENCES = %w[men women children]
  validates :preferences, inclusion: { in: PREFERENCES, allow_blank: true }

  def email_api_validation
    return if validate_mail?(self.email)

    errors.add(:email, 'Please provide a valid email')
  end

end
