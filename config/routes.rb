Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "homepage#index"
  get :contact_us, to: "pages#contact_us"

  resources :feedbacks, only: %i[create]

  namespace :my do
    resources :tips
  end

  resources :tips, only: %i[show index] do
    resources :comments, only: %i[create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tips, only: [] do
        patch "/likes", to: "tips/likes#update", module: :tips
      end
    end
  end

  namespace :my do
    resources :experiences
  end
end
