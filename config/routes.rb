Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "homepage#index"

  namespace :my do
    resources :tips
  end

  namespace :my do
    resources :experiences
  end
end
