class Subscription < ApplicationRecord
  include Validatetable
  include Categorable
  has_one :survey
  has_many :questions, through: :survey
  validates :email, presence: true, uniqueness: true#, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :preferences, presence: true
  # validate :email_api_validation

  PREFERENCES = %w[men women children]
  validates :preferences, inclusion: { in: PREFERENCES, allow_blank: true }


  QUESTION_CATEGORIES.each do |category|
    define_method("create_#{category}_survey") do

      survey || build_survey(category:category).tap(&:save)
    end
  end

  def email_api_validation
    return if validate_mail?(self.email)

    errors.add(:email, 'Please provide a valid email')
  end

end
