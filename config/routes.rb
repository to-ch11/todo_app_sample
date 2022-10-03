Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root "top#index"
  resources :tasks
  resources :menus, only: %i(index)
  resources :profiles, only: %i(edit update)
end
