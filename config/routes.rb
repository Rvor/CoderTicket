Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :tickets
  end
  get "/sign_up" => "users#new"
  post "/users" => "users#create"

  get "/log_in" => "sessions#new"
  post "/log_in" => "sessions#create"
  get "/log_out" => "sessions#destroy"
end
