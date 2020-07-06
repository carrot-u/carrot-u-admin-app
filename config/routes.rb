Rails.application.routes.draw do

  resources :homework_submissions
  resources :lectures
  resources :course_sessions
  resources :homeworks
  resources :mentors
  resources :application_questions

  get "/help/:page", to: "help#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # okta saml authenticates by posting to the callback url
  get 'sessions/create'
  get 'sessions/destroy'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post "/auth/:provider/callback", to: "sessions#create"
  get "/login", to: 'sessions#new'
  get "/dev_login/:email", to: 'sessions#dev' if Rails.env.development?
  get "user/show", to: 'users#show'
  get "users/", to: 'users#index'

  put "users/make_admin/:id", to: 'users#make_admin', as: 'make_admin'
  put "users/revoke_admin/:id", to: 'users#revoke_admin', as: 'revoke_admin'

  #signing up to be a mentor

  #mentor routes
  get '/mentors', to: 'mentors#index'

  #
  # Students
  #
  get "students/apply"
  post "students/waitlist"
  get "students/waiting_list"
  post "students/application"

  #
  # Admin special actions
  #
  get "admins/applications"
end
