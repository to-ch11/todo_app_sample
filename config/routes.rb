Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  resources :tasks do
    resources :categories do
      member do
        get "sort"
      end
    end
  end
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "top#index"
end
