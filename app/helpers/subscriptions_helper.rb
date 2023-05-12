module SubscriptionsHelper
  def fashion_preferences(pref, f)
    f.label t("global.forms.#{pref}").to_sym
  end

end
