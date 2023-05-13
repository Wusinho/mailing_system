class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show]
  before_action :create_survey, only: [:show]

  def show
    # @survey_questions.each { |question| SurveyAnswer.find_or_create_by(question_id: question.id, survey_id: @subscription.survey.id)  }
  end
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
    else
      turbo_error_message(@subscription)
    end
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def create_survey
    @subscription.create_survey
    @survey_questions = @subscription.questions.distinct
    @survey = @subscription.survey
    @survey_questions.each { | question | @survey.survey_answers.build(question_id: question.id) }

  end

  def subscription_params
    params.require(:subscription).permit(:email, preferences: [])
  end


end
