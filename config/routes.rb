Rails.application.routes.draw do

    root to: "courses#home"

    resources :courses
    resources :facilities

end
