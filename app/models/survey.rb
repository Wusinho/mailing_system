class Survey < ApplicationRecord
  include Categorable

  belongs_to :subscription#, foreign_key: 'subscription_id'
  has_many :survey_questions
  has_many :questions, through: :survey_questions
  has_many :survey_answers
  accepts_nested_attributes_for :survey_answers, allow_destroy: true
  after_create_commit :create_questions

  QUESTION_CATEGORIES.each do |category|
      define_method("create_#{category}_questions") do
        questions = Question.find_cat_type(category)
        return create_survey_questions(questions) if survey_questions.present?
        survey_questions
      end
    end

    def create_survey_questions(questions)
      questions_ids = questions.pluck(:id)
      questions_ids.each do |question_id|
        survey_questions.create(question_id: question_id)
      end
    end

  def create_questions
    questions = Question.find_cat_type(category)
    question_ids = questions.pluck(:id)

    question_ids.each do |question_id|
      survey_questions.create(question_id: question_id)
    end
  end

  def create_survey_answer_instances
    questions.each { |question| self.survey_answers.build(question_id: question.id) }
  end

end
