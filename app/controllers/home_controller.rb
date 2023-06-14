class HomeController < ApplicationController
  def index
    @subscription = Subscription.new
  end

end
