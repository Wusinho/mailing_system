module SubscriptionsHelper
  def fashion_preferences(pref)
    t("global.forms.#{pref}").to_sym
  end

  def complete_subscription(survey)
    if survey.completed
      render 'surveys/completed_survey'
    else
      render 'questions/form', survey: survey
    end
  end




end
