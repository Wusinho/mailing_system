class SubscriptionMailer < ApplicationMailer
  default from: 'notifications@nicolet.com'

  def mailing_subscription(subscription)
    mail(to: subscription.email, subject: t('subscription_email.subject'))
  end

end
