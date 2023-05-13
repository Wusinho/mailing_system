class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show]
  before_action :create_survey, only: [:show]

  def show
    @survey_questions = @subscription.questions.distinct
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
  end

  def subscription_params
    params.require(:subscription).permit(:email, preferences: [])
  end


end
