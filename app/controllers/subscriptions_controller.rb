class SubscriptionsController < ApplicationController

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      SubscriptionMailer.mailing_subscription(@subscription, request.host_with_port).deliver_later
      render turbo_stream: turbo_stream.replace(
        'subscription_form',
        partial: 'surveys/survey_link',
        locals: { subscription: @subscription })
    else
      turbo_error_message(@subscription)
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email, preferences: [])
  end

end
