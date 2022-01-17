Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { 
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
       }
    end
  end
end
