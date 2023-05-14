Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :subscriptions
    resources :surveys
    root "home#index"
  end
end
