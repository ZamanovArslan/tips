Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :impressions
    resources :tips
    resources :comments
    resources :likes
    resources :experiences
    resources :feedbacks
    resources :life_areas

    root to: "users#index"
  end

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "homepage#index"

  get :contact_us, to: "feedbacks#new"
  resources :feedbacks, only: %i[create]

  namespace :my do
    resources :tips, only: %i[index create destroy]
    resources :experiences, only: %i[index create destroy]
    resources :companies, only: %i[index create destroy]
  end

  resources :tips, only: %i[show] do
    resources :comments, only: %i[create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tips, only: [] do
        patch "/likes", to: "tips/likes#update", module: :tips
      end
    end
  end
end
