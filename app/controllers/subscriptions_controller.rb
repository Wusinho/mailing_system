class SubscriptionsController < ApplicationController

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      render turbo_stream: turbo_stream.replace('subscription_form', partial: 'surveys/survey_link', locals:
        { subscription: @subscription })
    else
      turbo_error_message(@subscription)
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email, preferences: [])
  end

end
