Rails.application.routes.draw do
root "courses#index"
resources :courses
resources :teachers, only: [:new, :create]
resources :students, only: [:new, :create]
resource :session, only: [:new, :destroy, :create]
end
