Rails.application.routes.draw do
  root "home#show"
  get "/dashboard", to: "users#show"
  get "/auth/:provider/callback", to: 'sessions#create'
end
