Rails.application.routes.draw do
    root to: "courses#home"

    resources :courses do
        resources :enrolls, shallow: true, only: [:create, :destroy]
        get :enrolled, on: :collection
    end

    resources :facilities

    resources :users, only: [:new, :create]

    resource :session, only: [:new, :create, :destroy]

    get("/dashboard",{to:"users#dashboard"})
end
