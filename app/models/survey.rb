class Survey < ApplicationRecord
  include Categorable

  belongs_to :subscription#, foreign_key: 'subscription_id'
  has_many :survey_questions
  has_many :questions, through: :survey_questions
  has_many :survey_answers
  accepts_nested_attributes_for :survey_answers, allow_destroy: true

  QUESTION_CATEGORIES.each do |category|
    define_method("#{category}_questions") do
      questions = Question.where(category_type: "#{category}_questions")
      questions.each { |question| SurveyQuestion.create(survey_id: self.id, question_id: question.id) }
    end
  end

  def create_survey_answer_instances
    questions.each { |question| self.survey_answers.build(question_id: question.id) }
  end

end
