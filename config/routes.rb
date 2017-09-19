Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get    '/login' => 'sessions#new', as: :login
  post   '/login' => 'sessions#create'
  delete '/logout' =>  'sessions#destroy', as: :logout
  get '/categories' => 'categories#index'
  get '/categories/:id' => 'categories#show', as: :category
  #get '/users/:user_id/queries' => 'queries#index'
  get '/queries' => 'queries#index', as: :queries
  get '/queries/:id' => 'queries#show', as: :query
  get '/queries/:id/edit' => 'queries#edit', as: :edit_query
  patch '/queries/:id' => 'queries#update'
  # delete '/terms/:id' => 'queries#show', as: :query
  resources :users

end
