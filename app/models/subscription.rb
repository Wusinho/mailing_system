class Subscription < ApplicationRecord
  include Validatetable
  include Categorable
  has_one :survey#, class_name: 'Survey', foreign_key: 'subscription_id'
  has_many :questions, through: :survey
  validates :email, presence: true, uniqueness: true#, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :preferences, presence: true
  # validate :email_api_validation

  PREFERENCES = %w[men women children]
  validates :preferences, inclusion: { in: PREFERENCES, allow_blank: true }

  QUESTION_CATEGORIES.each do |category|
    define_method("create_#{category}_survey") do

      create_survey.tap { |survey| survey.send("create_#{category}_questions") }
                   .tap { |survey| survey.create_survey_answer_instances }
    end
  end

  def email_api_validation
    return if validate_mail?(self.email)

    errors.add(:email, 'Please provide a valid email')
  end

  def create_survey
    Survey.find_or_create_by(subscription_id: self.id)
  end

end
