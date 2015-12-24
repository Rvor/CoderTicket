Rails.application.routes.draw do

  root 'events#index'

  resources :events do
    resources :tickets
  end
  get "/mylist" => "events#mylist"
  get "/sign_up" => "users#new"
  post "/users" => "users#create"
  put "/events/:id/publish", to: "events#publish", :as => "publish"

  get "/log_in" => "sessions#new"
  post "/log_in" => "sessions#create"
  get "/log_out" => "sessions#destroy"
  get "/events/search/:query", :to => "events#search", :as => :search

  resources :venues
end
