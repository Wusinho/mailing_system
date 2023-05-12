class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      else
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email, preferences: [])
          .tap { |p| p[:preferences].reject!(&:blank?) }
  end


end
