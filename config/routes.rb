Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"

devise_scope :user do
get "/sign_in" => "devise/sessions#new" 
get "/sign_up" => "devise/registrations#new"
 end
end