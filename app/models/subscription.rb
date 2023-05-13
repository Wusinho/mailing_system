class Subscription < ApplicationRecord
  include Validatetable
  has_one :survey
  has_many :questions, through: :survey
  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :preferences, presence: true
  # validate :email_api_validation

  PREFERENCES = %w[men women children]
  validates :preferences, inclusion: { in: PREFERENCES, allow_blank: true }

  def email_api_validation
    return if validate_mail?(self.email)

    errors.add(:email, 'Please provide a valid email')
  end

  def create_survey
    survey = Survey.create(subscription_id: self.id)
    questions = Question.where(category_type: 'coupon_question')
    questions.each do |question|
      SurveyQuestion.create(survey_id: survey.id, question_id: question.id)
    end
  end

end
