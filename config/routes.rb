Rails.application.routes.draw do

    root to: "courses#home"

    resources :courses
    resources :users, only: [:new, :create]

    resource :session, only: [:new, :create, :destroy]

end
