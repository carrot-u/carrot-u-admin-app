Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # okta saml authenticates by posting to the callback url
  get 'sessions/create'
  get 'sessions/destroy'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post "/auth/:provider/callback", to: "sessions#create"
  get "/login", to: 'sessions#new'
  get "/dev_login/:email", to: 'sessions#dev' if Rails.env.development?
end
