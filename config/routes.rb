Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :subscriptions, only: [:create]
    resources :surveys, only: [:create, :show, :update]
    root "home#index"
  end
end
