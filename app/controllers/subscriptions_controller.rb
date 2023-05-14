class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show]
  before_action :create_survey, only: [:show]

  def show
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
    @survey = @subscription.create_coupon_subscription_survey
  end

  def subscription_params
    params.require(:subscription).permit(:email, preferences: [])
  end


end
