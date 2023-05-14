class SubscriptionMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def mailing_subscription(subscription)
    mail(to: subscription.email, subject: t('subscription_email.subject'))
  end

end
