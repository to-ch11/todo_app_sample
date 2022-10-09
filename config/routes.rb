Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root 'tasks#index'
  resources :tasks
  resources :menus, only: %i[ index ]
  resource :profiles, only: %i[ edit update ]
end
